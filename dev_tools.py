"""ShutIt module. See http://shutit.tk
"""

from shutit_module import ShutItModule


class dev_tools(ShutItModule):


	def is_installed(self, shutit):
		return shutit.file_exists('/root/shutit_build/module_record/' + self.module_id + '/built')

	def build(self, shutit):
		shutit.install('git')
		shutit.send('groupadd -g 1000 imiell')
		shutit.send('useradd -d /home/imiell -s /bin/bash -m imiell -u 1000 -g 1000')
		shutit.login(user='imiell')
		shutit.send('git clone https://github.com/ianmiell/dotfiles.git ~/.dotfiles')
		shutit.send('cd ~/.dotfiles')
		# TODO other git repos
		shutit.multisend('script/bootstrap',{'What is your github author name':'Ian Miell','':'ian.miell@gmail.com'})
		shutit.logout()
		shutit.install('vim python-pip curl jq git apt-file git net-tools nmap sshfs graphviz alien moreutils telnet adduser athena-jot build-essential iotop strace tcpdump iproute ltrace lsof manpages man-db mlocate subversion cvs sysstat tcl tmux tree unzip zip util-linux whois wget xclip xterm xmlstarlet ansible ant ascii asciidoc eatmydata erlang virtualenv socat xdotool inotify_tools screen haproxy golang xmlto rsync')
		return True

	#def get_config(self, shutit):
	#	shutit.get_config(self.module_id,'item','default')
	#	return True

	#def check_ready(self, shutit):
	#	return True
	
	#def start(self, shutit):
	#	return True

	#def stop(self, shutit):
	#	return True

	def finalize(self, shutit):
		shutit.send('updatedb')
		return True

	#def remove(self, shutit):
	#	return True

	#def test(self, shutit):
	#	return True

def module():
	return dev_tools(
		'ianmiell.github.com.dev_tools.dev_tools', 81940468.001,
		description='imiell dev tools image',
		maintainer='',
		depends=['shutit.tk.setup']
	)

