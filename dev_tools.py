"""ShutIt module. See http://shutit.tk
"""

from shutit_module import ShutItModule
import string


class dev_tools(ShutItModule):

	def build(self, shutit):
		# git
		shutit.install('git')
		shutit.send('groupadd -g 1000 imiell')
		shutit.send('useradd -d /home/imiell -s /bin/bash -m imiell -u 1000 -g 1000')
		shutit.login(user='imiell')
		# dotfiles
		shutit.send('git clone https://github.com/ianmiell/dotfiles.git ~/.dotfiles')
		shutit.send('cd ~/.dotfiles')
		shutit.multisend('script/bootstrap',{'What is your github author name':'Ian Miell','What is your github author email':'ian.miell@gmail.com','verwrite all':'O'})
		shutit.send('cd -')
		# ttygif
		shutit.send('git clone https://github.com/icholy/ttygif.git')
		shutit.send('cd ttygif')
		shutit.send('cp ttygif /usr/bin')
		shutit.send('cp concat.sh /usr/bin')
		shutit.send('make')
		shutit.send('cd -')
		# learn, for wget-finder - to find files on the net
		shutit.send('git clone https://github.com/chilicuil/learn')
		# j2
		shutit.send('git clone https://github.com/rupa/z')
		shutit.add_to_bashrc('. /home/imiell/z/z.sh')
		shutit.logout()
		# CPAN
		shutit.multisend('cpan',{'Would you like to configure as much as possible automatically':'','What approach do you want':'','Would you like me to automatically choose some CPAN mirror':'','Would you like me to append that to /home/imiell/.bashrc now':'','cpan.1.>':'exit'})
		# CPAN requires a re-login
		shutit.login(command='su -')
		shutit.send('cpan install Graph::Easy') # Allows rendering of graphs as text files: http://search.cpan.org/~tels/Graph-Easy/bin/graph-easy
		shutit.logout()
		shutit.send('wget -qO- https://search.maven.org/remote_content?g=com.madgag&a=bfg&v=LATEST > bfg.jar')
		# pips
		shutit.send_host_file('/tmp/requirements.txt','context/requirements.txt')
		shutit.send('pip install -r /tmp/requirements.txt')
		shutit.send('rm -f /tmp/requirements.txt')
		shutit.send('gem install bropages')
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

