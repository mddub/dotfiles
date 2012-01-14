# Includes
source ~/.git-completion.bash
[ -f /nail/scripts/aliases.sh ] && . /nail/scripts/aliases.sh

# Paths
export PATH=$PATH:~/local/bin:~/pg/loc/aws/bin
export PYTHONPATH=$PYTHONPATH:~/local/py-lib:~/local/bin
export NODE_PATH=$NODE_PATH:~/local/lib/jsctags/

# Aliases
alias te='eval `~/local/bin/tmux-env`'
[ $(hostname) != "dev20" ] && alias d='ssh -A mwilson@dev20'
# Make ls output better
if [ ${OSTYPE//[0-9.]/} == "darwin" ]; then
	alias ls='ls -FGh'
else
	alias ls='ls -Fh --color'
fi

# Make prompt a colorful display of pwd and git branch
export PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]$(__git_ps1 " \[\e[1;36m\](%s)\[\e[0;39m\] ")\$ '

# Start in working directory
if [ -d ~/pg/yelp-main ]; then
	cd ~/pg/yelp-main
fi
