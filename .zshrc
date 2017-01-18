#  Author: lwc
#  Email: ms0472904@gmail.com
#  Last Updated: 2017/01/18
# ------------------------------------------------------------------------------

export ZSH=/home/lwc/.oh-my-zsh

# powerlevel9k
# ------------------------------------------------------------------------------
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs context_joined dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)

# oh-my-zsh
# ------------------------------------------------------------------------------
HYPHEN_INSENSITIVE="true"
export UPDATE_ZSH_DAYS=30
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git autojump extract catimg encode64 urltools zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh


# Environment Variable
# ------------------------------------------------------------------------------
export TERM="xterm-256color"

# Alias
# ------------------------------------------------------------------------------

alias vi='vim'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'

alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'

alias ~="cd ~"
alias c='clear'

alias path='echo -e ${PATH//:/\\n}'
alias qfind="find . -name "
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

alias myip='curl http://orange.tw/'
alias netCons='lsof -i'
alias lsock='sudo lsof -i -P'
alias lsockU='sudo lsof -nP | grep UDP'
alias lsockT='sudo lsof -nP | grep TCP'
alias openPorts='sudo lsof -i | grep LISTEN'

# Some Functions
# ------------------------------------------------------------------------------
cd() { builtin cd "$@"; ls -d *([1,50]); }
mcd () { mkdir -p "$1" && cd "$1"; }
zipf () { zip -r "$1".zip "$1" ; }

if [[ "$(uname)" == "Darwin" ]]; then
    cdf () {
        currFolderPath=$( /usr/bin/osascript << EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }
fi

ff () { qfind "$@" ; }
ffs () { qfind "$@"'*' ; }
ffe () { qfind '*'"$@" ; }
pid () { lsof -t -c "$@" ; }
ggg () { grep -rn "$1" . ;}
myps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

ii() {
    RED="\e[31m"
    NC="\e[0m"
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
}

# tmux
# ------------------------------------------------------------------------------
ta () { tmux a -t $1; }
tn () { tmux new -s $1; }
tl () { tmux ls; }


# pyenv
# ------------------------------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# rbenv
# ------------------------------------------------------------------------------
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source $HOME/.rbenv/completions/rbenv.zsh
