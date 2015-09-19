FROM debian:jessie

RUN apt-get update
RUN apt-get install -y -qq curl git python-pip
WORKDIR /opt
RUN git clone https://github.com/ianmiell/shutit.git
WORKDIR shutit
RUN pip install -r requirements.txt

##########
# Editors:
# vim
# vim-common
# vim-pathogen
# ranger: vim-based file browser
###############
# Network tools:
# curl
# net-tools
# nmap
# wget
# whois
# socat
# openssh-client
# openssh-server
# openssl
# libwww-perl
# nettcp
# mssh
# netpipe-tcp
# netsed
# netsniff-ng
# mit-proxy: ssl-capable http proxy
# tcpflow
# etherape: visualise the network in real time - very neat
# tcpd: monitor and manage incoming tcp connections
###############
# Source control:
# git git-man subversion cvs
###############
# Package management:
# apt-file alien apt-utils
###############
# System debugging:
# iotop
# strace
# tcpdump
# iproute
# ltrace
# lsof
# inotify-tools
# sysstat
# ddd
# tshark
###############
# Sysadmin:
# pkg-config
# cron
# anacron
# at
# fslint
# sudo
# lsb-base
# lsb-release
# procps: free, kill etc
# software-properties-common: package management
###############
# Finding files:
# mlocate
###############
# Languages:
# tcl
# erlang
# python-pip
# python-dev
# perl
# perl-base
# perl-modules
# golang: Go
# rhino:  javascript interpreter
# virtualenv: python environments
###############
# General utility/productivity/dev tools:
# rlwrap
# expect-dev
# sed
# patch
# tmux
# xmlstarlet
# xclip
# jq
# telnet
# athena-jot
# xterm
# eatmydata
# util-linux
# moreutils
# sshfs
# tree
# screen
# xdotool
# xmlto
# expect
# expect-dev
# coreutils
# shellcheck
# bashdb
# parallel
# readline-common
# sec
# time
# tree
# tofrodos
# ascii
# daemon: turn programs into daemons
###############
# Compiling:
# build-essential
# ncurses-base
# ncurses-bin
###############
# Unpacking:
# zip
# unzip
###############
# Server applications:
# haproxy
# webfs
###############
# Config management:
# ansible
###############
# Who's using bandwidth?:
# nethogs
# iftop
###############
# Required for pip requirements:
# libldap2-devlibgpgme11-dev
# liblzma-dev
# libsmbclient-dev
# libsasl2-dev
# libattr1-dev
###############
# Graphics:
# gocr: command line OCR
# libmagick++-dev
# graphviz
###############
# Docs:
# linux-doc
# libcorelinux-doc
# user-mode-linux-doc
# perl-doc
# vim-doc
# perl-doc
# vim-doc
# asciidoc
###############
# Testing:
# ab
# seige
###############
# Backup:
# bup
# rsync
###############
# Build tools:
# ant
# maven
###############
# Containers:
# docker.io
###############
# Databases:
# postgresql-client


RUN apt-get install -y vim vim-common vim-doc vim-pathogen curl net-tools nmap wget whois socat openssh-client openssh-server openssl libwww-perl git git-man subversion cvs apt-file alien apt-utils iotop strace tcpdump iproute ltrace lsof inotify-tools sysstat ddd tshark mlocate tcl erlang python-pip python-dev tmux xmlstarlet xclip jq telnet athena-jot xterm eatmydata util-linux moreutils sshfs tree screen xdotool xmlto expect expect-dev coreutils build-essential zip unzip haproxy ansible nethogs iftop ranger mitmproxy libldap2-dev libgpgme11-dev liblzma-dev libsmbclient-dev libsasl2-dev libattr1-dev #required for pip requirements ant ascii asciidoc virtualenv golang rsync docker.io at cron expect-dev patch perl perl-base perl-doc perl-modules sed anacron mssh daemon fslint gocr netpipe-tcp netsed netsniff-ng pkg-config procps sudo tcpd time tree tofrodos sec rhino postgresql-client maven lsb-base lsb-release readline-common rlwrap software-properties-common ncurses-base ncurses-bin tcpflow graphviz linux-doc libcorelinux-doc user-mode-linux-doc perl-doc vim-doc bup shellcheck bashdb nettcp libmagick++-dev parallel ab silversearcher-ag ruby-dev webfs etherape



WORKDIR /space/git
RUN git clone https://github.com/ianmiell/docker-dev-tools-image.git
WORKDIR /space/git/docker-dev-tools-image
RUN /opt/shutit/shutit build --shutit_module_path /opt/shutit/library --delivery dockerfile

USER imiell

ENV JAVA_HOME=/usr

CMD ["/bin/bash"] 
