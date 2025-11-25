FROM public.ecr.aws/docker/library/rabbitmq:management AS rabbitmq-management

FROM public.ecr.aws/debian/debian:stable

RUN apt-get update && \
  apt-get install -y \
  ca-certificates \
  curl \
  extrepo \
  gnupg \
  lsb-release \
  pipx \
  wget

RUN tee /etc/apt/sources.list.d/debian.sources > /dev/null <<EOF
Types: deb
URIs: http://deb.debian.org/debian
Suites: stable stable-updates oldstable
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb
URIs: http://deb.debian.org/debian-security
Suites: stable-security
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
EOF

RUN tee /etc/apt/sources.list.d/debian-backports.sources > /dev/null <<EOF
Types: deb
URIs: http://deb.debian.org/debian
Suites: $(lsb_release -cs)-backports
Components: main contrib non-free non-free-firmware
Enabled: yes
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
EOF

RUN tee /etc/apt/preferences.d/mijn_voorkeuren.pref > /dev/null <<EOF
Package: *
Pin: release a=stable
Pin-Priority: 666

Package: *
Pin: release a=stable-updates
Pin-Priority: 555

Package: *
Pin: release a=stable-security
Pin-Priority: 555

Package: *
Pin: release a=$(lsb_release -cs)-backports
Pin-Priority: 111

Package: *
Pin: release a=oldstable
Pin-Priority: 100
EOF

RUN tee /etc/extrepo/config.yaml > /dev/null <<EOF
---
url: https://extrepo-team.pages.debian.net/extrepo-data
dist: debian
version: $(lsb_release -cs)
enabled_policies:
- main
- contrib
- non-free
EOF

RUN wget -O - 'https://apt.releases.hashicorp.com/gpg' | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

RUN wget -O - 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x1D357EA7D10C9320371BDD0279EA15C0E82E34BA&exact=on' | gpg --dearmor -o /etc/apt/keyrings/mydumper.gpg && \
  echo "deb [signed-by=/etc/apt/keyrings/mydumper.gpg] https://mydumper.github.io/mydumper/repo/apt/debian $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/mydumper.list

RUN wget -O - 'https://apt.corretto.aws/corretto.key' | gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
  echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list

RUN wget -O - 'https://azlux.fr/repo.gpg' | gpg --dearmor -o /usr/share/keyrings/azlux.gpg && \
  echo "deb [signed-by=/usr/share/keyrings/azlux.gpg] https://packages.azlux.fr/debian/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azlux.list

RUN wget -O - 'https://packages.buildkite.com/helm-linux/helm-debian/gpgkey' | gpg --dearmor -o /usr/share/keyrings/helm.gpg > /dev/null && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | tee /etc/apt/sources.list.d/helm-stable-debian.list

RUN wget -O /tmp/k9s_linux_$(dpkg --print-architecture).deb https://github.com/derailed/k9s/releases/latest/download/k9s_linux_$(dpkg --print-architecture).deb

RUN apt-get update && \
  apt-get install -y \
  aha \
  asn \
  awscli \
  bind9-host \
  bsdgames \
  bzip2 \
  cmatrix \
  cowsay \
  cpufetch \
  crawl \
  debianutils \
  dnsutils \
  duf \
  elinks \
  figlet \
  findutils \
  fortune fortunes fortunes-bofh-excuses fortunes-debian-hints fortunes-min \
  git \
  git-crypt \
  git-lfs \
  gping \
  grepcidr \
  helm \
  hping3 \
  httpie \
  ipcalc \
  iputils-ping \
  java-21-amazon-corretto-jdk \
  jq \
  /tmp/k9s_linux_$(dpkg --print-architecture).deb \
  kcat \
  kubernetes-client \
  mtr-tiny \
  mydumper \
  nethack-console \
  links \
  lynx \
  mariadb-client \
  moon-buggy \
  nano \
  ncat \
  ncdu \
  net-tools \
  netcat-openbsd \
  netstress \
  ninvaders \
  nmap \
  nodejs \
  npm \
  openssh-client \
  openssh-server \
  p7zip-full \
  postgresql-client \
  pyenv \
  python3-venv \
  rclone \
  rsync \
  s3fs \
  sl \
  stress \
  subnetcalc \
  tcpdump \
  telnet \
  terraform \
  toilet \
  traceroute \
  tree \
  unzip \
  valkey-tools \
  vim \
  whois \
  zip

RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

RUN pipx install tftui

RUN npm i -g wscat

COPY --from=rabbitmq-management /usr/local/bin/rabbitmqadmin /usr/local/bin/rabbitmqadmin

# remove junk
RUN pipx ensurepath
RUN apt-get clean
RUN rm -rf /tmp/k9s_linux_$(dpkg --print-architecture).deb

WORKDIR /tmp

CMD [ "sleep", "infinity" ]
