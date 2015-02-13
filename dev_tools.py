"""ShutIt module. See http://shutit.tk
"""

from shutit_module import ShutItModule


class dev_tools(ShutItModule):

	def build(self, shutit):
		shutit.install('git')
		shutit.send('groupadd -g 1000 imiell')
		shutit.send('useradd -d /home/imiell -s /bin/bash -m imiell -u 1000 -g 1000')
		shutit.login(user='imiell')
		shutit.send('git clone https://github.com/ianmiell/dotfiles.git ~/.dotfiles')
		shutit.send('cd ~/.dotfiles')
		# TODO other git repos
		shutit.multisend('script/bootstrap',{'What is your github author name':'Ian Miell','What is your github author email':'ian.miell@gmail.com'})
		shutit.logout()
		shutit.install('vim vim-common vim-doc')
		shutit.install('python-pip')
		shutit.install('curl')
		shutit.install('jq')
		shutit.install('git')
		shutit.install('git-man')
		shutit.install('apt-file')
		shutit.install('net-tools')
		shutit.install('nmap')
		shutit.install('sshfs')
		shutit.install('graphviz')
		shutit.install('alien')
		shutit.install('moreutils')
		shutit.install('telnet')
		shutit.install('adduser')
		shutit.install('athena-jot')
		shutit.install('build-essential')
		shutit.install('iotop')
		shutit.install('strace')
		shutit.install('tcpdump')
		shutit.install('iproute')
		shutit.install('ltrace')
		shutit.install('lsof')
		shutit.install('manpages')
		shutit.install('man-db')
		shutit.install('mlocate')
		shutit.install('subversion')
		shutit.install('cvs')
		shutit.install('sysstat')
		shutit.install('tcl')
		shutit.install('tmux')
		shutit.install('tree')
		shutit.install('unzip')
		shutit.install('zip')
		shutit.install('util-linux')
		shutit.install('whois')
		shutit.install('wget')
		shutit.install('xclip')
		shutit.install('xterm')
		shutit.install('xmlstarlet')
		shutit.install('ansible')
		shutit.install('ant')
		shutit.install('ascii')
		shutit.install('asciidoc')
		shutit.install('eatmydata')
		shutit.install('erlang')
		shutit.install('virtualenv')
		shutit.install('socat')
		shutit.install('xdotool')
		shutit.install('inotify-tools')
		shutit.install('screen')
		shutit.install('haproxy')
		shutit.install('golang')
		shutit.install('xmlto')
		shutit.install('rsync')
		shutit.install('vim-pathogen')
		shutit.install('docker.io')
		shutit.install('apt-file')
		shutit.install('at')
		shutit.install('coreutils')
		shutit.install('cron')
		#shutit.install('errno')
		shutit.install('ehterape')
		shutit.install('ddd')
		shutit.install('expect')
		shutit.install('openssh-client')
		shutit.install('openssh-server')
		shutit.install('openssl')
		shutit.install('patch')
		shutit.install('perl')
		shutit.install('perl-base')
		shutit.install('perl-doc')
		shutit.install('perl-modules')
		shutit.install('sed')

## Packages to install when getting a new machine:
#
#sudo apt-get install -y abs-guide
#sudo apt-get install -y anacron
#sudo apt-get install -y apt-show-versions
#sudo apt-get install -y apt-transport-https
#sudo apt-get install -y apt-utils
#sudo apt-get install -y apt-file
#sudo apt-get install -y aptsh
#sudo apt-get install -y bashdb
#sudo apt-get install -y daemon
#sudo apt-get install -y dwww
#sudo apt-get install -y etherape
#sudo apt-get install -y expect-dev
#sudo apt-get install -y expect-lite
#sudo apt-get install -y fluxbox
#sudo apt-get install -y fslint
#sudo apt-get install -y gocr
#sudo apt-get install -y god
#sudo apt-get install -y lsb-base
#sudo apt-get install -y lsb-release
#sudo apt-get install -y lshw
#sudo apt-get install -y markdown
#sudo apt-get install -y maven
#sudo apt-get install -y mssh
#sudo apt-get install -y ncurses-base
#sudo apt-get install -y ncurses-bin
#sudo apt-get install -y netpipe-tcp
#sudo apt-get install -y netsed
#sudo apt-get install -y netsniff-ng
#sudo apt-get install -y openjdk-6-jdk
#sudo apt-get install -y openjdk-6-jre
#sudo apt-get install -y openjdk-6-jre-headless
#sudo apt-get install -y openjdk-6-jre-lib
#sudo apt-get install -y openprinting-ppds
#sudo apt-get install -y oracle-java7-installer
#sudo apt-get install -y parted
#sudo apt-get install -y partitionmanager
#sudo apt-get install -y pass
#sudo apt-get install -y pkg-config
#sudo apt-get install -y postgresql-client
#sudo apt-get install -y postgresql-client-9.1
#sudo apt-get install -y postgresql-client-common
#sudo apt-get install -y procps
#sudo apt-get install -y qt-at-spi
#sudo apt-get install -y rdesktop
#sudo apt-get install -y readline-common
#sudo apt-get install -y rekonq
#sudo apt-get install -y resolvconf
#sudo apt-get install -y rhino
#sudo apt-get install -y rlwrap
#sudo apt-get install -y rpcbind
#sudo apt-get install -y rsyslog
#sudo apt-get install -y rtkit
#sudo apt-get install -y sec
#sudo apt-get install -y sensible-utils
#sudo apt-get install -y software-properties-common
#sudo apt-get install -y ssh-import-id
#sudo apt-get install -y ssl-cert
#sudo apt-get install -y sudo
#sudo apt-get install -y syslinux
#sudo apt-get install -y syslinux-common
#sudo apt-get install -y syslinux-legacy
#sudo apt-get install -y tcpd
#sudo apt-get install -y time
#sudo apt-get install -y tofrodos
#sudo apt-get install -y toshset
#sudo apt-get install -y tree
#sudo apt-get install -y unattended-upgrades
#sudo apt-get install -y watershed
#sudo apt-get install -y whiptail
#sudo apt-get install -y xchm
#sudo apt-get install -y xml-core
#sudo apt-get install -y python-sphinx

		return True

	#def get_config(self, shutit):
	#	shutit.get_config(self.module_id,'item','default')
	#	return True

	def finalize(self, shutit):
		shutit.send('updatedb')
		return True

def module():
	return dev_tools(
		'ianmiell.github.com.dev_tools.dev_tools', 81940468.001,
		description='imiell dev tools image',
		maintainer='',
		depends=['shutit.tk.setup']
	)

