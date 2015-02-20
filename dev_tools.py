"""ShutIt module. See http://shutit.tk
"""

from shutit_module import ShutItModule


class dev_tools(ShutItModule):

	def build(self, shutit):
		# git
		shutit.install('git')
		shutit.send('groupadd -g 1000 imiell')
		shutit.send('useradd -d /home/imiell -s /bin/bash -m imiell -u 1000 -g 1000')
		shutit.login(user='imiell')
		shutit.send('git clone https://github.com/ianmiell/dotfiles.git ~/.dotfiles')
		shutit.send('cd ~/.dotfiles')
		# TODO other git repos
		shutit.multisend('script/bootstrap',{'What is your github author name':'Ian Miell','What is your github author email':'ian.miell@gmail.com'})
		shutit.logout()
		packages = set()
		packages.add('vim')
		packages.add('vim-common')
		packages.add('vim-doc')
		packages.add('python-pip')
		packages.add('python-dev')
		packages.add('curl')
		packages.add('net-tools')
		packages.add('nmap')
		packages.add('socat') # network tools
		packages.add('jq')
		packages.add('git git-man')
		packages.add('apt-file apt-utils')
		packages.add('util-linux')
		packages.add('net-tools')
		packages.add('nmap')
		packages.add('sshfs')
		packages.add('graphviz')
		packages.add('alien')
		packages.add('moreutils')
		packages.add('telnet')
		packages.add('adduser')
		packages.add('athena-jot')
		packages.add('build-essential')
		packages.add('iotop')
		packages.add('strace')
		packages.add('tcpdump')
		packages.add('iproute')
		packages.add('ltrace')
		packages.add('lsof')
		packages.add('mlocate')
		packages.add('subversion')
		packages.add('cvs')
		packages.add('sysstat')
		packages.add('tcl')
		packages.add('tmux')
		packages.add('tree')
		packages.add('zip unzip')
		packages.add('whois')
		packages.add('wget')
		packages.add('xclip')
		packages.add('xterm')
		packages.add('xmlstarlet')
		packages.add('ansible')
		packages.add('ant')
		packages.add('ascii')
		packages.add('asciidoc')
		packages.add('eatmydata')
		packages.add('erlang')
		packages.add('virtualenv')
		packages.add('socat')
		packages.add('xdotool')
		packages.add('inotify-tools')
		packages.add('screen')
		packages.add('haproxy')
		packages.add('golang')
		packages.add('xmlto')
		packages.add('rsync')
		packages.add('vim-pathogen')
		packages.add('docker.io')
		packages.add('at')
		packages.add('coreutils')
		packages.add('cron')
		packages.add('ddd')
		packages.add('expect-dev expect')
		packages.add('openssh-client openssh-server openssl')
		packages.add('patch')
		packages.add('perl perl-base perl-doc perl-modules')
		packages.add('sed')
		packages.add('anacron')
		packages.add('mssh')
		packages.add('daemon')
		packages.add('fslint')
		packages.add('gocr')
		packages.add('netpipe-tcp')
		packages.add('netsed')
		packages.add('netsniff-ng')
		packages.add('pkg-config')
		packages.add('procps')
		packages.add('sudo')
		packages.add('tcpd')
		packages.add('time')
		packages.add('tree')
		packages.add('tofrodos')
		packages.add('sec')
		packages.add('rhino')
		packages.add('postgresql-client')
		packages.add('maven')
		packages.add('lsb-base')
		packages.add('lsb-release')
		packages.add('readline-common')
		packages.add('rlwrap')
		packages.add('software-properties-common')
		packages.add('ncurses-base')
		packages.add('ncurses-bin')
		packages.add('tcpflow')
		packages.add('mitmproxy') #ssl-capable http proxy
		packages.add('libldap2-dev libgpgme11-dev liblzma-dev libsmbclient-dev libsasl2-dev libattr1-dev') #required for pip requirements
		packages_list = map(None,packages)
		shutit.install(string.join(packages_list,' '))
		# CPAN
		shutit.multisend('cpan',{'Would you like to configure as much as possible automatically':'','What approach do you want':'','Would you like me to automatically choose some CPAN mirror':'','Would you like me to append that to /home/imiell/.bashrc now':'','cpan.1.>':'exit'})
		# CPAN requires a re-login
		shutit.login(command='su -')
		shutit.send('cpan install Graph::Easy') # Allows rendering of graphs as text files: http://search.cpan.org/~tels/Graph-Easy/bin/graph-easy
		shutit.logout()
		# pips
		shutit.send_host_file('/tmp/requirements.txt','context/requirements.txt')
		#shutit.send('pip install -r /tmp/requirements.txt')
		#shutit.send('rm -f /tmp/requirements.txt')
		return True

	def get_config(self, shutit):
		shutit.get_config(self.module_id,'type','monolith')
		return True

	def finalize(self, shutit):
		shutit.install('manpages man-db')
		shutit.send('updatedb')
		shutit.send('apt-file update')
		shutit.send('apt-get clean')
		return True

def module():
	return dev_tools(
		'ianmiell.github.com.dev_tools.dev_tools', 81940468.001,
		description='imiell dev tools image',
		maintainer='',
		depends=['shutit.tk.setup']
	)

