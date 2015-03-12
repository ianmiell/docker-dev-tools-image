FROM debian:jessie

RUN apt-get update
RUN apt-get install -y -qq curl git python-pip
WORKDIR /opt
RUN git clone https://github.com/ianmiell/shutit.git
WORKDIR shutit
RUN pip install -r requirements.txt

##########
# Editors:
#vim vim-common vim-doc vim-pathogen
###############
# Network tools
# curl net-tools nmap wget whois socat openssh-client openssh-server openssl libwww-perl 
# mit-proxy: ssl-capable http proxy
###############
# Source control
# git git-man subversion cvs
###############
# Package management
# apt-file alien apt-utils
###############
# System debugging
# iotop strace tcpdump iproute ltrace lsof inotify-tools sysstat ddd
###############
# Finding files
# mlocate
###############
# Languages
# tcl erlang python-pip python-dev
###############
# General utility/productivity/dev tools
# tmux xmlstarlet xclip jq telnet athena-jot xterm eatmydata util-linux moreutils sshfs tree screen xdotool xmlto expect expect-dev coreutils
###############
# Compiling
# build-essential
###############
# Unpacking
# zip unzip
###############
# Server applications
# haproxy 
###############
# Config management
# ansible
###############
# Who's using bandwidth?
# nethogs iftop
###############
# vim-based file browser
# ranger -
###############
# required for pip requirements
# libldap2-dev libgpgme11-dev liblzma-dev libsmbclient-dev libsasl2-dev libattr1-dev
###############
# docs
# linux-doc libcorelinux-doc user-mode-linux-doc perl-doc vim-doc
###############
# backup
# bup rsync
# TO Classify
# ant ascii asciidoc virtualenv golang docker.io at cron expect-dev patch perl perl-base perl-doc perl-modules sed anacron mssh daemon fslint gocr netpipe-tcp netsed netsniff-ng pkg-config procps sudo tcpd time tree tofrodos sec rhino postgresql-client maven lsb-base lsb-release readline-common rlwrap software-properties-common ncurses-base ncurses-bin tcpflow graphviz



RUN apt-get install -y vim vim-common vim-doc vim-pathogen curl net-tools nmap wget whois socat openssh-client openssh-server openssl libwww-perl git git-man subversion cvs apt-file alien apt-utils iotop strace tcpdump iproute ltrace lsof inotify-tools sysstat ddd mlocate tcl erlang python-pip python-dev tmux xmlstarlet xclip jq telnet athena-jot xterm eatmydata util-linux moreutils sshfs tree screen xdotool xmlto expect expect-dev coreutils build-essential zip unzip haproxy ansible nethogs iftop ranger mitmproxy libldap2-dev libgpgme11-dev liblzma-dev libsmbclient-dev libsasl2-dev libattr1-dev #required for pip requirements ant ascii asciidoc virtualenv golang rsync docker.io at cron expect-dev patch perl perl-base perl-doc perl-modules sed anacron mssh daemon fslint gocr netpipe-tcp netsed netsniff-ng pkg-config procps sudo tcpd time tree tofrodos sec rhino postgresql-client maven lsb-base lsb-release readline-common rlwrap software-properties-common ncurses-base ncurses-bin tcpflow graphviz linux-doc libcorelinux-doc user-mode-linux-doc perl-doc vim-doc bup



WORKDIR /space/git
RUN git clone https://github.com/ianmiell/docker-dev-tools-image.git
WORKDIR /space/git/docker-dev-tools-image
RUN /opt/shutit/shutit build --shutit_module_path /opt/shutit/library --delivery bash

USER imiell

CMD ["/bin/bash"] 
