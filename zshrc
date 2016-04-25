# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"


# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Add by Duff :  Change dir auto
AUTO_CD="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"
HISTCONTROL=ignoreboth

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git ruby autojump rvm mvn)
plugins=(git node mvn docker brew sublime history cp github oc)

if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# Homebrew stuff : put /usr/local/bin in front of everything else in the default path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Enable ZSH autocomplete
autoload -U compinit
compinit

# Enable Bash autocomplete compatibility
autoload -U bashcompinit
bashcompinit

# Source external environment
if [ -f ~/env/env.source ]; then
    source ~/env/env.source
#else
#    echo "~/env/ folder not found, nothing was sourced"
fi


# Git prompt configuration
export PS1='${ret_status}%{$fg_bold[green]%}%p %{$fg[white]%}%n@%M:%{$fg_bold[magenta]%}[%*] %{$fg[cyan]%}%72<...<%~%<< %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
$ '

if [ -d $HOME/.rvm/bin ]; then
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

export PATH=$PATH:~/bin

#eval `dircolors ~/.ls_colors`

if whence dircolors >/dev/null; then
	eval "$(dircolors -b)"
	zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
	alias ls='ls --color'
else
	export CLICOLOR=1
	zstyle ':completion:*:default' list-colors ''
fi

export SVN_EDITOR=vim

if [ -d $HOME/.gvm/groovy/current/bin ]; then
	PATH=$PATH:$HOME/.gvm/groovy/current/bin
fi


if [ -d $HOME/devhome/app/apache-maven-*/bin/ ]; then
	PATH=$PATH:`dirname $HOME/devhome/app/apache-maven-*/bin/mvn`
fi

if [ -f ~/.npm_completion ]; then
	source ~/.npm_completion
fi

if [ -f /usr/local/share/zsh/site-functions ]; then
	source /usr/local/share/zsh/site-functions/*
fi

if [ -d /usr/lib/libreoffice/program ]; then
	PATH=$PATH:/usr/lib/libreoffice/program
fi

if which jenv > /dev/null; then
	#export JENV_ROOT=/usr/local/opt/jenv
	export PATH="$HOME/.jenv/bin:$PATH"
   	eval "$(jenv init -)";
fi

export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
