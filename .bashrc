#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# should fix the excess .bash_history-*.tmp files in $HOME
HISTFILESIZE=2000	# default=500
HISTSIZE=1000		# default-500

#==========================================================
# Aliases:
#===========================================================
# OS
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# mine
alias conda_start='conda init -v'
alias conda_stop='conda init --reverse -v'
alias get_idf='. $HOME/Downloads/esp/esp-idf/export.sh'

#==========================================================
# Command prompt edit:
#==========================================================
#PS1='[\u@\h \W]\$ '	# Original PS1
# Colors
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
BLUE="\[$(tput setaf 4)\]"
RESET="\[$(tput sgr0)\]"

# to show git
source /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
# Custom PS1
PS1="[${RED}\u${RESET}@${GREEN}\h${RESET} ${BLUE}\W${RESET}\$(__git_ps1 \"(%s)\")]\$ "

#===========================================================
# Conda
#===========================================================
[ -f /opt/miniforge/etc/profile.d/conda.sh ] && source /opt/miniforge/etc/profile.d/conda.sh

