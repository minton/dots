# Git prompt stuff
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '
#---END

# 1Password SSH 
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
#---END

# Postgres utilities
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
#---END

# Sublime Text
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin":$PATH
#---END

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
eval "$(/usr/local/bin/brew shellenv)"
#---END

# asdf-vm
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
#---END

# Ensure local bin is in PATH <--this should happen near the end
export PATH=/Users/minton/.bin:$PATH
#---END

# Fix `ls` command
#  This requires coreutils 
alias ls='gls -lhF --group-directories-first --color=auto'
LS_COLORS=$LS_COLORS:'di=1;36:fi=0;32:ex=1;91' 
export LS_COLORS
#---END

# Set default working directory
cd ~/dev
#---END

