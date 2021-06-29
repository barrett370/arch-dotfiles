autoload -Uz colors                && colors
autoload -Uz compinit              && compinit
autoload -Uz edit-command-line     && zle -N edit-command-line
autoload -Uz url-quote-magic       && zle -N self-insert url-quote-magic
autoload -Uz bracketed-paste-magic && zle -N bracketed-paste bracketed-paste-magic

HISTCONTROL=ignoredups
HISTFILE=~/.zsh_history
HISTSIZE=2000
KEYTIMEOUT=1
SAVEHIST=2000


export LC_ALL="en_US.UTF-8"
setopt HIST_FCNTL_LOCK
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

export ZSH="$HOME/.oh-my-zsh"
fpath+=("$HOME/.zsh/pure")
#PROMPT='%{$fg[blue]%} λ %{$reset_color%}'
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME="robbyrussell"
#
#
#autoload -U promptinit; promptinit
#PURE_PROMPT_SYMBOL='λ'
##PURE_PROMPT_VICMD_SYMBOL='ν'
#prompt pure

eval "$(starship init zsh)"
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh
VIM_MODE_VICMD_KEY='^D'
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt
bindkey -rpM viins '<esc>'
#plugins=(
#    archlinux
#    cp
#    docker 
#    git
#    github
#    pip
#    pipenv
#    pyenv
#    repo
#    tmux 
#    tmuxinator
#    vi-mode
#    virtualenv
#    vundle
#    z
#    zsh-autosuggestions
#    history-substring-search
#    zsh-syntax-highlighting
#)	

#bindkey -v
#bindkey -M vicmd v edit-command-line
export KEYTIMEOUT=1
#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

#function zle-line-init zle-keymap-select {
#    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
#    zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select

# Add a space in the first prompt
set nocompatible              " be iMproved, required
filetype off                  " required

#WERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line

# include Z, yo
#. ~/.scripts/z.sh
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:$HOME/misc/bolt-utils/bin:/Users/sbarrett/Library/Python/3.7/bin:$HOME/applications/flutter/bin:$HOME/applications/android-studio/bin:$HOME/.local/bin":$HOME/.emacs.d/bin:$HOME/.gem/ruby/2.7.0/bin
#eval "$(rbenv init -)"
export PATH=$PATH:~/.scripts/:~/.keys/:~/applications
# opam configuration
#test -r /Users/sbarrett/.opam/opam-init/init.zsh && . /Users/sbarrett/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#export FABPATH=$HOME/misc/
export GIT_HOME=$HOME/git-repos
export SSH_KEY_PUB=$HOME/.ssh/id_rsa.pub
#eval $(thefuck --alias)



#export PATH="$GOENV_ROOT/bin:$PATH"
##eval "$(goenv init -)"
#export GOENV_ROOT="$HOME/.goenv"
#export PATH="$GOENV_ROOT/bin:$PATH"
#eval "$(goenv init -)"
#source /home/sam/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#. ~/applications/z.sh

#initialize Z (https://github.com/rupa/z) 
#. ~/z.sh
# Alii: 
alias matlab='_JAVA_AWT_WM_NONREPARENTING=1 matlab'
alias .f='dotfiles'
alias ls='lsd'
alias emacs='devour emacs'
alias xem='vim /home/sam/.xmonad/xmonad.hs'
alias vem='vim /home/sam/.config/nvim/init.vim'
alias dockers='sudo docker'
alias apminstall='sudo apt install'
function dotdiff {
    echo "$(dotfiles diff --name-only)"
}
alias dotadd='dotfiles add'
alias dotpush='dotfiles push'
alias dotcommit='dotfiles commit -m'
alias gc='git commit'
alias gp='git push'
alias gpu='git pull'
alias h='history | grep'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias shit='fuck'
alias sod='fuck'
alias vim='nvim'
alias cl='clear ; ls ' #clear and run subsequent command 
alias c='clear'
alias lsz='ls --size'
alias ra='ranger'
alias cat='bat'
alias gaa='git add -A'
alias open='rifle'
alias gs='git status'
alias gd='git diff --diff-filter=M'
alias e='exit'
#alias vim='nvim'
alias scim='sc-im'
alias grep='rg'
alias pacman='sudo pacman'
alias restic-backup='restic backup -r /mnt/vault/restic-backups -e /home/sam/git-clones -e /home/sam/.cache /home/sam'


function dotblast {
    dotcommit "$1"
    dotpush
}
function gbrac {
    git branch $1
    git checkout $1
}
function clone {
	pwd_list=(${(s:/:)$1})
	pwd_list=('/' $pwd_list)
	echo $pwd_list '\n'
	echo ${pwd_list[-1]}
	git clone $1 $HOME/git-repos/${pwd_list[-1]}
}
function vp {
	volt profile set $1
}
alias vd='volt profile set default'


export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$PATH:/usr/local/go/bin
#export GOENV_ROOT="$HOME/.goenv"
#export PATH="$GOENV_ROOT/bin:$PATH"
#eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source $HOME/applications
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"




export PATH=$PATH:/usr/local/cuda-10.1/bin
export CUDADIR=/usr/local/cuda-10.1

function options() {
    PLUGIN_PATH="$HOME/.oh-my-zsh/plugins/"
    for plugin in $plugins; do
        echo "\n\nPlugin: $plugin"; grep -r "^function \w*" $PLUGIN_PATH$plugin | awk '{print $2}' | sed 's/()//'| tr '\n' ', '; grep -r "^alias" $PLUGIN_PATH$plugin | awk '{print $2}' | sed 's/=.*//' |  tr '\n' ', '
    done
}






#
#PROMPT_COMMAND='prompt'
#precmd() { eval "$PROMPT_COMMAND" }
#function prompt()
#{
#    if [ ! $PIPENV_ACTIVE ]; then
#      if [ `pipenv --venv 2>/dev/null` ]; then
#        export PIPENV_INITPWD="$PWD"
#        pipenv shell
#      fi
#    elif [ $PIPENV_INITPWD ] ; then
#      cd "$PIPENV_INITPWD"
#      unset PIPENV_INITPWD
#    fi
#}
#


eval "$(gh completion -s zsh)"

 #source /usr/share/fzf/key-bindings.zsh 
 #source /usr/share/fzf/completion.zsh 
#powerline-daemon -q
#. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sam/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sam/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sam/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sam/google-cloud-sdk/completion.zsh.inc'; fi


source ~/.secrets
[ -f "/home/sam/.ghcup/env" ] && source "/home/sam/.ghcup/env" # ghcup-env

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/2.2.10/gems/vagrant-2.2.10/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("/usr/local/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag chpwd_functions;
if [[ -z ${chpwd_functions[(r)_direnv_hook]} ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi


