FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive 

###############
# Editors:
###############
# vim:            you know
# ranger:         vim-based file browser
###############
# Network tools:
###############
# sniffit:        packet sniffer with ncurses interface
# curl:           stream tcp requests to stdout
# net-tools:      arp:        manipulate ARP cache
#                 ifconfig:   manipulate interfaces
#                 netstat:    network connections
#                 rarp:       manipulate system RARP table
#                 nameif:     name ifs based on MAC address
#                 route:      manipulate routing table
#                 plipconfig: parallel port manipulation
#                 slattach:   serial link -> network mode
#                 mii-tool:   manipulate interface status
#                 iptunnel:   create an ip tunnel (?)
#                 ipmaddr:    list ip addresses and links (?)
# nmap:           host port analyser
# wget:           get web resources
# whois:          dns lookup tool
# dnstracer:      dns trace tool
# socat:          socket and general file concatenator
# openssh-client: ssl client
# openssh-server: ssl server - handy for certificate work
# openssl:        ssl package
# libwww-perl:    perl www libs
# mssh:           multiple ssh at once
# netpipe-tcp:    NetPIPE answers such questions as: how soon will a given data
#                   block of size k arrive at its destination? Which network and
#                   protocol will transmit size k blocks the fastest? What is a
#                   given network's effective maximum throughput and saturation
#                   level?  Does there exist a block size k for which the
#                   throughput is maximized? How much communication overhead is
#                   due to the network communication protocol layer(s)? How
#                   quickly will a small (< 1 kbyte) control message arrive, and
#                   which network and protocol are best for this purpose?
# netsed:         sed on network streams
# netsniff-ng:    another network sniffer. nice man page
# mit-proxy:      ssl-capable http proxy
# tcpflow:        records the flow of tcp connections
# etherape:       visualise the network in real time - very neat
# tcpd:           monitor and manage incoming tcp connections
# tcpick:         useful tcp tracker, like tcpdump but easier
# tcpreplay:      replay tcp streams at different speeds
# tcpreen:        network man in the middle for analysis etc
# tcpspy:         log tcp connections to syslog
# tcputils:       mini-inetd - small TCP/IP connection dispatcher (very small,
#                   no deps - handy for servers you want to paste programs to -
#                   xz down to 3k!)
#                 tcpbug - TCP/IP connection bugging device - also small
#                 tcpconnect  - general TCP/IP client - telnet
#                 tcplisten - general TCP/IP server - use nc
#                 getpeername - get name of connected TCP/IP peer
# tcptrack:       tracks tcp sessions with a simple ncurses interface you can
#                   sort on
# stone:          repeats tcp packets to a different network endpoint
# darkstat:       serves info about network over http
# sqlmap:         try and break into a website's db
# nocache:        bypass filesystem cache
# ndiff:          compare nmap outputs
# dwdiff:         word-based differ with stats
# iodine:         tunnel through DNS
# tsocks:         Only got SSH and want a VPN-like experience? This can help.
# mininet:        mini network emulator
###############
# Source control:
###############
# git:            you know
# gitg:           visual interface to git
# git-repair:     repairs even when git fsck doesn't work
# tig:            ncurses interface to git
# subversion:     you know
# cvs:            you know
###############
# Package management:
###############
# apt-file:       maintains database of files in deb packages
# alien:          allows yum installs into deb systems
###############
# System debugging:
###############
# cpulimit:       limit CPU for a process
# iotop:          top for disk IO
# iftop:          network top
# tcpdump:        generic tcp recorder
# tshark:         TShark is able to detect, read and write the same capture
#                   files that are supported by Wireshark
# strace:         system call tracer
# ltrace:         library call tracer
# iproute:        ip routing into (ip route)
# nethogs:        bandwidth use by process
# sysstat:        sysstat config file
# inotify-tools:  notify on file activity
# lsof:           file tracker
# fatrace:        file open etc tracer
# ddd:            visual C debugger
# time:           timing info for commands
###############
# Sysadmin:
###############
# cron:           you know
# anacron:        you know
# at:             run commands at times
# fslint:         useful filesystem programs:
#                 findup: find DUPlicate files
#                 findnl: find Name Lint (problems with filenames)
#                 findu8: find filenames with invalid utf8 encoding
#                 findbl: find Bad Links
#                 findsn: find Same Name (clashing filenames)
#                 finded: find Empty Directories
#                 findid: find files with dead user IDs
#                 findns: find Non Stripped executables
#                 findrs: find Redundant Whitespace in files
#                 findtf: find Temporary Files
#                 findul: find possibly Unused Libraries
#                 zipdir: Reclaim wasted space in ext2 dir entries
# sudo:           you know
# lsb-base:       base linux packages
# lsb-release:    base linux release info
# procps:         free, kill etc
# i7z:            CPU tools for Intel i-chips
# squashfs-tools: squash data nicely
###############
# Finding files:
###############
# mlocate:        local filename database
###############
# Languages:
###############
# tcl:                you know
# erlang:             you know
# perl:               you know
# perl-base:          basic perl files
# perl-modules:       perl modules
# golang:             Go
# rhino:              javascript interpreter
# python-pip:         python packaging tool
# python2.7-examples: example python scripts
# virtualenv:         python environments TODO: not in ubuntu
###############
# General utility/productivity/dev tools:
###############
# rlwrap
# sed:            stream editor
# patch:          diff applier
# tmux:           terminal multiplexer
# xmlstarlet:     xml tools
# xclip:          copy text to clipboard
# jq:             json querier
# telnet:         you know
# athena-jot:     list numbers
# xterm:          simple terminal
# eatmydata:      write to files without fsyncing
# coreutils:      central linux utils
# util-linux:     various utils
# moreutils:      linux utilities
#                   chronic:  runs a command quietly unless it fails
#                   combine:  combine the lines in two files using boolean operations
#                   errno:    look up errno names and descriptions
#                   ifdata:   get network interface info without parsing ifconfig output
#                   ifne:     run a program if the standard input is not empty
#                   isutf8:   check if a file or standard input is utf-8
#                   lckdo:    execute a program with a lock held
#                   mispipe:  pipe two commands, returning the exit status of the first
#                   parallel: run multiple jobs at once
#                   pee:      tee standard input to pipes
#                   sponge:   soak up standard input and write to a file
#                   ts:       timestamp standard input
#                   vidir:    edit a directory in your text editor
#                   vipe:     insert a text editor into a pipe
#                   zrun:     automatically uncompress arguments to command
# sshfs:          mount an ssh connection as a filesystem
# screen:         terminal multiplexer
# xdotool:        simulate/program X keyboard and mouse events
# xmlto:          convert xml to various formats
# expect:         automate inputs/outputs
# shellcheck:     shell script checker TODO: not in ubuntu
# bashdb:         bash debugger
# sec:            simple event correlator, when things happen, do things
# tree:           print contents in tree format
# tofrodos:       convert files to/from dos format
# ascii:          print ascii table
# asciinema:      record your session
# daemon:         turn programs into daemons
# actiona:        automation for web interactions
# dateutils:      command line date and time utilities
#                   dadd:     add durations to dates or times
#                   dconv:    convert dates between calendars or time zones
#                   ddiff:    compute durations between dates and times
#                   dgrep:    find date or time matches in input stream
#                   dround:   round dates or times to designated values
#                   dseq:     generate sequences of dates or times
#                   dtest:    compare dates or times
#                   strptime: command line version of the C function
# x11-utils:      X utilities
#                   xev: show x events as they happen

###############
# Compiling:
###############
# pkg-config:      info about installed libraries
# build-essential: essential build tools, eg make
# ncurses-base:    ncurses files
# ncurses-bin:     tools for manipulating terminals
###############
# Unpacking:
###############
# zip:             you know
# unzip:           you know
# xz:              very tight compression algorithm
###############
# Server applications:
###############
# haproxy:         load balancing proxy
# webfs:           static content webserver
###############
# Config management:
###############
# ansible:         like puppet etc
###############
# Who's using bandwidth?:
###############
###############
# Dev/common packages:
###############
# python-dev:                 python development files
# expect-dev:                 expect development files
# vim-common:                 common vim files
# software-properties-common: package management
# readline-common:            readline files
###############
# Graphics:
###############
# gocr:                command line OCR
# graphviz:            generate graphs
###############
# Docs:
###############
# linux-doc:           kernel documentation
# libcorelinux-doc:    linux dev reference manual
# perl-doc:            perl docs
# vim-doc:             vimdoc
# asciidoc:            ascii-based documentation tool
###############
# Testing:
###############
# ab:                  apache bench TODO: not in ubuntu 14.04
# seige:               simulate ddos TODO: not in ubuntu 14.04
###############
# Backup:
###############
# bup:                 backup program for large files
# rsync:               intelligent copy tool
###############
# Build tools:
###############
# ant:                 java-based build tool
# maven:               ant++
###############
# Containers:
###############
# docker.io:           you know
###############
# Databases:
###############
# postgresql-client:   postgres client (psql)
###############
# Fun:
###############
# hollywood:           fill screen with hollywood-style terminal
###############
# Media:
###############
# youtube-dl:          youtube downloader



RUN apt-get update && apt-get install -y vim vim-common vim-doc curl net-tools nmap wget whois socat openssh-client openssh-server openssl libwww-perl tig git git-man subversion cvs apt-file alien iotop strace tcpdump iproute ltrace lsof inotify-tools sysstat ddd tshark mlocate tcl erlang python-pip python-dev tmux xmlstarlet xclip jq telnet athena-jot xterm eatmydata util-linux moreutils sshfs tree screen xdotool xmlto expect expect-dev coreutils build-essential zip unzip haproxy ansible nethogs iftop ranger mitmproxy ant ascii asciinema asciidoc golang rsync docker at cron expect-dev patch perl perl-base perl-doc perl-modules sed anacron mssh daemon fslint gocr netpipe-tcp netsed netsniff-ng pkg-config procps sudo tcpd time tree tofrodos sec rhino postgresql-client maven lsb-base lsb-release readline-common rlwrap software-properties-common ncurses-base ncurses-bin tcpflow graphviz linux-doc libcorelinux-doc user-mode-linux-doc perl-doc vim-doc bup libmagick++-dev silversearcher-ag ruby-dev webfs etherape python2.7-examples sniffit tcpick tcpreplay tcpreen tcpspy tcputils darkstat stone fatrace bashdb gitg git-repair i7z sqlmap ndiff hollywood actiona dateutils youtube-dl dwdiff iodine tsocks mininet dnstracer squashfs-tools x11-utils

RUN apt-get update && apt-get install -y python-pip git
RUN pip install shutit

WORKDIR /opt
RUN git clone https://github.com/ianmiell/docker-dev-tools-image.git
WORKDIR /opt/docker-dev-tools-image
RUN shutit build --shutit_module_path library -d bash
USER imiell

ENV JAVA_HOME=/usr

CMD ["/bin/bash"] 
