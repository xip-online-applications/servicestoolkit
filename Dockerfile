FROM debian:stable

RUN apt-get update && \
  apt-get install -y \
  awscli \
  bzip2 \
  curl \
  debianutils \
  dnsutils \
  findutils \
  git \
  git-crypt \
  git-lfs \
  gnupg \
  iputils-ping \
  jq \
  kubernetes-client \
  locate \
  mariadb-client \
  nano \
  netcat-openbsd \
  net-tools \
  nmap \
  openssh-client \
  openssh-server \
  p7zip-full \
  postgresql-client \
  rclone \
  redis-tools \
  rsync \
  s3fs \
  subnetcalc \
  telnet \
  traceroute \
  tree \
  unzip \
  vim \
  wget \
  zip

RUN wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
  apt-get update && \
  apt-get install -y terraform && \
  apt-get clean

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

CMD [ "sleep", "infinity" ]
