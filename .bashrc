# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PS1='\[\033[01;31m\]\u\[\033[01;00m\]@\[\033[01;36m\]\h\[\033[01;00m\]:\[\033[01;36m\]\w\[\033[01;00m\]\$\[\033[01;00m\]'

# auto complete and history for python
export PYTHONSTARTUP=$HOME/.pythonstartup

# alias name for base command
alias ll='ls -l'
alias vi='vim'

# alias name for mysql connection
# alias db='mysql -hhost -uuser -ppassword -P3306 db_name'

# for screen command
alias sls='screen -ls'
alias sr='screen -r'
alias sS='screen -S'
