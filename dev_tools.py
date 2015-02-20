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
		shutit.install('curl')
		shutit.install('vim vim-common vim-doc')
		shutit.install('python-pip python-dev')
		shutit.install('jq')
		shutit.install('git git-man')
		shutit.install('apt-file apt-utils')
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
		shutit.install('at')
		shutit.install('coreutils')
		shutit.install('cron')
		shutit.install('ddd')
		shutit.install('expect-dev expect')
		shutit.install('openssh-client openssh-server openssl')
		shutit.install('patch')
		shutit.install('perl perl-base perl-doc perl-modules')
		shutit.install('sed')
		shutit.install('anacron')
		shutit.install('mssh')
		shutit.install('daemon')
		shutit.install('fslint')
		shutit.install('gocr')
		shutit.install('netpipe-tcp')
		shutit.install('netsed')
		shutit.install('netsniff-ng')
		shutit.install('pkg-config')
		shutit.install('procps')
		shutit.install('sudo')
		shutit.install('tcpd')
		shutit.install('time')
		shutit.install('tree')
		shutit.install('tofrodos')
		shutit.install('sec')
		shutit.install('rhino')
		shutit.install('postgresql-client')
		shutit.install('maven')
		shutit.install('lsb-base')
		shutit.install('lsb-release')
		shutit.install('readline-common')
		shutit.install('rlwrap')
		shutit.install('software-properties-common')
		shutit.install('ncurses-base')
		shutit.install('ncurses-bin')
		shutit.install('tcpflow')
		shutit.install('mitmproxy') #ssl-capable http proxy
		shutit.install('libldap2-dev libgpgme11-dev liblzma-dev libsmbclient-dev libsasl2-dev libattr1-dev') #required for pip requirements
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

