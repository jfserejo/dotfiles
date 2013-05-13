
# path to oh-my-zsh configuration files
export ZSH=$HOME/.oh-my-zsh

# disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# disable autosetting terminal title
export DISABLE_AUTO_TITLE="true"

# disable colors in ls
# export DISABLE_LS_COLORS="true"

# load theme from ~/.oh-my-zsh/themes/
#export ZSH_THEME="kolo"
export ZSH_THEME="gentoo"


# load plugins
plugins=(git macports osx pip virtualenvwrapper vi-mode vundle)

# sources
source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/history-substring-search/history-substring-search.zsh

# locale
export LC_CTYPE=en_US.UTF-8

# key bindings
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# aliases
alias rm="rm -i"
alias tmux="tmux -u"
alias apt-get="sudo apt-get"
alias aptitude="sudo aptitude"
alias xzc="tar cJf"
alias xzd="tar xJf"
alias shutdown="sudo shutdown"
alias halt="sudo halt"

# xz setting
export XZ_OPT="-9"

# os specific settings
if [[ $('uname') == 'Linux' ]]; then
    # load ssh keys
    #eval `keychain --eval --nogui -Q -q id_rsa` # ERROR OUTPUT # OFF FOR NOW!

    bindkey '\e[8~' end-of-line
    bindkey '\e[7~' beginning-of-line
    bindkey '\e[3~' delete-char
    bindkey '\e[2~' overwrite-mode
elif [[ $('uname') == 'Darwin' ]]; then
    # path for MacPorts
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH

    export CLICOLOR=1
    export LSCOLORS=exgxfaFadxcadabxBxFxfx

    bindkey "\e[F" end-of-line
    bindkey "\e[H" beginning-of-line

    alias vim="mvim -v"
fi
