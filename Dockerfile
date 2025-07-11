FROM debian:stable

RUN apt-get update && \
  apt-get install -y \
  ca-certificates \
  gnupg \
  lsb-release \
  wget

RUN wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN wget -O - https://apt.corretto.aws/corretto.key | gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
  echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list

RUN apt-get update && \
  apt-get install -y \
  awscli \
  bsdgames \
  bzip2 \
  curl \
  debianutils \
  dnsutils \
  findutils \
  git \
  git-crypt \
  git-lfs \
  hping3 \
  iputils-ping \
  java-21-amazon-corretto-jdk \
  jq \
  kubernetes-client \
  locate \
  mariadb-client \
  nano \
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
  traceroute \
  tree \
  unzip \
  vim \
  zip && \
  apt-get clean

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

CMD [ "sleep", "infinity" ]
