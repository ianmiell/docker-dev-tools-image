FROM debian:jessie

RUN apt-get update
RUN apt-get install -y -qq curl git python-pip
WORKDIR /opt
RUN git clone https://github.com/ianmiell/shutit.git
WORKDIR shutit
RUN pip install -r requirements.txt

# Editors
RUN apt-get install -y vim vim-common vim-doc vim-pathogen
# Network tools
RUN apt-get install -y curl net-tools  nmap socat wget whois socat openssh-client openssh-server openssl
# Source control
RUN apt-get install -y git git-man subversion cvs
# Package management
RUN apt-get install -y apt-file alien apt-utils
# System debugging
RUN apt-get install -y iotop strace tcpdump iproute ltrace lsof inotify-tools sysstat ddd
# Finding
RUN apt-get install -y mlocate
# Languages
RUN apt-get install -y tcl erlang python-pip python-dev
# General utility/productivity/dev tools
RUN apt-get install -y tmux xmlstarlet xclip jq telnet athena-jot xterm eatmydata util-linux moreutils sshfs tree screen xdotool xmlto expect expect-dev coreutils
# Compiling
RUN apt-get install -y build-essential
# Unpacking
RUN apt-get install -y zip unzip 
# Server applications
RUN apt-get install -y haproxy
# Config management
RUN apt-get install -y ansible

#ssl-capable http proxy
RUN apt-get install -y mitmproxy
#required for pip requirements
RUN apt-get install -y libldap2-dev libgpgme11-dev liblzma-dev libsmbclient-dev libsasl2-dev libattr1-dev #required for pip requirements
# TO Classify
RUN apt-get install -y ant ascii asciidoc virtualenv golang rsync docker.io at cron expect-dev patch perl perl-base perl-doc perl-modules sed anacron mssh daemon fslint gocr netpipe-tcp netsed netsniff-ng pkg-config procps sudo tcpd time tree tofrodos sec rhino postgresql-client maven lsb-base lsb-release readline-common rlwrap software-properties-common ncurses-base ncurses-bin tcpflow graphviz
# docs
RUN apt-get install -y linux-doc libcorelinux-doc user-mode-linux-doc perl-doc vim-doc



WORKDIR /space/git
RUN git clone https://github.com/ianmiell/docker-dev-tools-image.git
WORKDIR /space/git/docker-dev-tools-image
RUN /opt/shutit/shutit build --shutit_module_path /opt/shutit/library --delivery bash

USER imiell

CMD ["/bin/bash"] 
