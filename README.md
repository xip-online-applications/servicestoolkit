# servicestoolkit

[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://hub.docker.com/r/xipdockeruser/servicestoolkit)

[![servicestoolkit](https://github.com/xip-online-applications/servicestoolkit/actions/workflows/cicd.yml/badge.svg)](https://github.com/xip-online-applications/servicestoolkit/actions/workflows/cicd.yml)

Container with troubleshooting tools used by XIP Online Services.

## System & Base Packages

| Package           | Description                                              |
| ----------------- | -------------------------------------------------------- |
| `ca-certificates` | Common CA certificates for SSL/TLS verification          |
| `curl`            | Command-line tool for transferring data with URL syntax  |
| `gnupg`           | GNU Privacy Guard, cryptographic software                |
| `lsb-release`     | Linux Standard Base version reporting utility            |
| `wget`            | Network downloader for retrieving files from web servers |

## Development & Version Control

| Package     | Description                                     |
| ----------- | ----------------------------------------------- |
| `git`       | Distributed version control system              |
| `git-crypt` | Transparent file encryption in git repositories |
| `git-lfs`   | Git Large File Storage extension                |
| `vim`       | Vi IMproved, advanced text editor               |
| `nano`      | Simple command-line text editor                 |

## Network & DNS Tools

| Package          | Description                                           |
| ---------------- | ----------------------------------------------------- |
| `asn`            | ASN (Autonomous System Number) lookup tool            |
| `bind9-host`     | DNS lookup utility from BIND 9                        |
| `dnsutils`       | DNS utilities including dig, nslookup, nsupdate       |
| `gping`          | Ping with a graph, visual ping tool                   |
| `hping3`         | Network tool for sending custom TCP/IP packets        |
| `iputils-ping`   | Tools to test network connectivity (ping)             |
| `mtr-tiny`       | Network diagnostic tool combining ping and traceroute |
| `ncat`           | Modern netcat implementation with SSL support         |
| `netcat-openbsd` | TCP/IP Swiss army knife for network connections       |
| `net-tools`      | Collection of network tools (netstat, ifconfig, etc.) |
| `nmap`           | Fancy port scanner                                    |
| `telnet`         | Remote terminal connection tool                       |
| `traceroute`     | Network diagnostic tool to trace packet routes        |
| `whois`          | Client for the whois directory service                |
| `wscat`          | Websocket debugging                                   |

## Network Utilities & Calculators

| Package      | Description                                               |
| ------------ | --------------------------------------------------------- |
| `grepcidr`   | Filter IP addresses matching IPv4/IPv6 CIDR specification |
| `ipcalc`     | IP subnet calculator                                      |
| `netstress`  | Network stress testing tool                               |
| `subnetcalc` | IPv4/IPv6 subnet calculator                               |
| `tcpdump`    | Traffic dumper                                            |

## Cloud & Container Tools

| Package                       | Description                                           |
| ----------------------------- | ----------------------------------------------------- |
| `awscli`                      | Amazon Web Services Command Line Interface            |
| `helm`                        | Kubernetes package manager                            |
| `java-21-amazon-corretto-jdk` | Amazon Corretto OpenJDK 21 distribution               |
| `k9s`                         | Kubernetes CLI with terminal UI                       |
| `kubernetes-client`           | Kubernetes command-line tool (kubectl)                |
| `rclone`                      | Command-line program to sync files with cloud storage |
| `s3fs`                        | FUSE file system for Amazon S3 buckets                |
| `terraform`                   | Infrastructure as Code tool                           |
| `tflint`                      | Linting Terraform                                     |
| `tftui`                       | Scroll through Terraform state in a less abstract way |

## Database Clients

| Package             | Description                                                         |
| ------------------- | ------------------------------------------------------------------- |
| `kcat`              | Producer and consumer for Apache Kafka                              |
| `mariadb-client`    | MariaDB database client tools                                       |
| `mydumper`          | Export a consistent backup of MariaDB databases                     |
| `myloader`          | Connects to the destination MariaDB database and imports the backup |
| `postgresql-client` | PostgreSQL database client tools                                    |
| `rabbitmqadmin`     | RabbitMQ Management                                                 |
| `valkey-tools`      | Valkey database client tools                                        |

## System Monitoring & Performance

| Package    | Description                                      |
| ---------- | ------------------------------------------------ |
| `cpufetch` | Simple CPU architecture fetching tool            |
| `duf`      | Disk Usage/Free Utility, modern 'df' alternative |
| `ncdu`     | NCurses Disk Usage analyser                      |
| `stress`   | System stress testing tool                       |
| `tree`     | Display directory tree structure                 |

## File & Archive Management

| Package      | Description                                  |
| ------------ | -------------------------------------------- |
| `bzip2`      | High-quality block-sorting file compressor   |
| `p7zip-full` | 7-Zip file archiver with full format support |
| `rsync`      | Fast, versatile file synchronization tool    |
| `unzip`      | Extraction utility for ZIP archives          |
| `zip`        | Archiver for creating ZIP files              |

## Text Processing & Utilities

| Package       | Description                                            |
| ------------- | ------------------------------------------------------ |
| `aha`         | ANSI HTML Adapter - converts terminal output to HTML   |
| `debianutils` | Includes `which`, which is awesome                     |
| `findutils`   | File finding utilities (find, locate, updatedb, xargs) |
| `jq`          | Command-line JSON processor                            |

## Web Browsers & Text-based Internet

| Package  | Description                    |
| -------- | ------------------------------ |
| `elinks` | Advanced text-mode web browser |
| `httpie` | API and HTTP interaction       |
| `links`  | Text-mode web browser          |
| `lynx`   | Classic text-mode web browser  |

## Games & Entertainment

| Package           | Description                                             |
| ----------------- | ------------------------------------------------------- |
| `bsdgames`        | Collection of classic BSD command-line games            |
| `cmatrix`         | 🐇                                                      |
| `cowsay`          | 🐮                                                      |
| `crawl`           | 🧝‍♂️                                                      |
| `figlet`          | Make large character ASCII banners out of ordinary text |
| `fortune`         | 🥠                                                      |
| `moon-buggy`      | 🌝                                                      |
| `nethack-console` | 💀                                                      |
| `ninvaders`       | 👾                                                      |
| `sl`              | 🚂                                                      |
| `toilet`          | Display large colourful characters in text mode         |

## SSH & Remote Access

| Package          | Description                                 |
| ---------------- | ------------------------------------------- |
| `openssh-client` | SSH client for secure remote connections    |
| `openssh-server` | SSH server for accepting remote connections |
