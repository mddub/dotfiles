# Includes
source ~/.git-completion.bash
[ -f /nail/scripts/aliases.sh ] && . /nail/scripts/aliases.sh

# Paths
export PATH=$PATH:~/local/bin:~/pg/loc/aws/bin
export PYTHONPATH=~/local/py-lib:~/local/bin

# Aliases
alias te='eval `~/local/bin/tmux-env`'
alias modifieds='git status -s | grep "^ M " | sed "s/^ M //g"'

if [ $(hostname) != "dev20" ]; then
	alias d='~/local/bin/growl_irc.sh; ssh -A mwilson@dev20'
fi

# Make ls output better
if [ ${OSTYPE//[0-9.]/} == "darwin" ]; then
	alias ls='ls -FGh'
else
	alias ls='ls -Fh --color'
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Make prompt a colorful display of pwd and git branch
export PS1='[ \[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\] ]$(__git_ps1 " \[\e[1;36m\](%s)\[\e[0;39m\] ")\$ '

# Start in working directory
if [ -d ~/pg/yelp-main ]; then
	cd ~/pg/yelp-main
fi
