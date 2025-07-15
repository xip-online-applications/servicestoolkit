FROM debian:stable

RUN apt-get update && \
  apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  wget

RUN wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

RUN wget -O - https://apt.corretto.aws/corretto.key | gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
  echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list

RUN wget -O - https://azlux.fr/repo.gpg | gpg --dearmor -o /usr/share/keyrings/azlux.gpg && \
  echo "deb [signed-by=/usr/share/keyrings/azlux.gpg] https://packages.azlux.fr/debian/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azlux.list

RUN wget -O /tmp/k9s_linux_$(dpkg --print-architecture).deb https://github.com/derailed/k9s/releases/latest/download/k9s_linux_$(dpkg --print-architecture).deb

RUN apt-get update && \
  apt-get install -y \
  aha \
  awscli \
  bind9-host \
  bsdgames \
  bzip2 \
  cpufetch \
  debianutils \
  dnsutils \
  duf \
  elinks \
  figlet \
  findutils \
  git \
  git-crypt \
  git-lfs \
  gping \
  grepcidr \
  hping3 \
  ipcalc \
  iputils-ping \
  java-21-amazon-corretto-jdk \
  jq \
  /tmp/k9s_linux_$(dpkg --print-architecture).deb \
  kubernetes-client \
  mtr-tiny \
  links \
  lynx \
  mariadb-client \
  nano \
  ncat \
  ncdu \
  net-tools \
  netcat-openbsd \
  netstress \
  nmap \
  openssh-client \
  openssh-server \
  p7zip-full \
  postgresql-client \
  rclone \
  redis-tools \
  rsync \
  s3fs \
  stress \
  subnetcalc \
  telnet \
  terraform \
  toilet \
  traceroute \
  tree \
  unzip \
  vim \
  whois \
  zip

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# ASN will be added to apt in 2026, so this script can be removed then and ASN added to apt
RUN curl https://raw.githubusercontent.com/nitefood/asn/master/asn > /usr/bin/asn && chmod 0755 /usr/bin/asn

# remove junk
RUN apt-get clean

CMD [ "sleep", "infinity" ]
