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
alias ls='ls -p --color=auto'
alias grep='grep --color=auto'

# mine
alias conda_start='conda init -v'
alias conda_stop='conda init --reverse -v'
alias get_idf='. $HOME/Downloads/esp/esp-idf/export.sh'
alias log_home_size='{ date; sudo du -hd1; } >> home_size.log'
alias hx='helix'
#==========================================================
# Functions
#==========================================================
# Compile and run a C++ file with one command
# Usage: runc main.cpp
runc() {
	# Extract filename without extension
	local filename="${1%.*}"

	# Compile the file
	g++ "$1" -o "$filename" && \

	# Run the executable if compilation succeeded
	./"$filename"
}

#==========================================================
# Command prompt edit:
#==========================================================
# Original PS1 and PROMPT_COMMAND
#PS1='[\u@\h \W]\$ '

# activating zoxide (z, zi) commands
eval "$(zoxide init bash --cmd cd)"
# activating fzf
eval "$(fzf --bash)"
# activating nvm (nodejs manager)
source /usr/share/nvm/init-nvm.sh

# source git_prompt.sh if it exists
GIT_PROMPT_PATH="/usr/share/git/completion/git-prompt.sh"
if which git &>/dev/null; then
	if [[ -f $GIT_PROMPT_PATH ]]; then
		source $GIT_PROMPT_PATH
	fi
fi

# outside to for more efficient usage
_RED="\[$(tput setaf 1)\]"
_GREEN="\[$(tput setaf 2)\]"
_BLUE="\[$(tput setaf 4)\]"
_RESET="\[$(tput sgr0)\]"

# assining git variables to color the output
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1

_build_custom_ps1(){
	# to show error if any
	local RET=$1
	local ERRMSG=""
	[[ $RET != 0 ]] && ERRMSG=" ${RET}"

  # 1. Capture what is ALREADY in PS1 (this includes Conda, venv, etc.)
  # We strip out the previous custom prompt parts to avoid "stacking" the same prompt over and over.
  local CURRENT_PREFIX=$(echo "$PS1" | sed 's/\[.*//')

  # Custom PS1
	local PS1_STRING

 	PS1_STRING="["					# Opening bracket
	PS1_STRING+="${_RED}\u${_RESET}@${_GREEN}\h"	# USER@HOSTNAME
	PS1_STRING+="${_RESET} ${_BLUE}\W"		# parent dir
	PS1_STRING+="${_RESET}\$(__git_ps1 \"(%s)\")"	# git rep
#	PS1_STRING+="${RESET}${GREEN}\$(git rev-parse --abbrev-ref HEAD 2>/dev/null \"(%s)\")"
	PS1_STRING+="${_RESET}${_RED}${ERRMSG}"		# RET
	PS1_STRING+="${_RESET}]"			# Closing bracket
	PS1_STRING+="\\$ "				# $
	export PS1="${CURRENT_PREFIX}${PS1_STRING}"
}
_ORIG_PC=("${PROMPT_COMMAND[@]}")

# Rebuild array in the specific order needed for error detection
PROMPT_COMMAND=('LAST_ERR=$?')      # Must be first
PROMPT_COMMAND+=("${_ORIG_PC[@]}")  # System-wide logic
PROMPT_COMMAND+=('_build_custom_ps1 "${LAST_ERR}"')
#===========================================================
# Conda
#===========================================================
[ -f /opt/miniforge/etc/profile.d/conda.sh ] && source /opt/miniforge/etc/profile.d/conda.sh

