# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim=$(which vimx)
alias docker="sudo docker"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git ruby autojump rvm mvn)
plugins=(git mvn docker)

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
else
    echo "~/env/ folder not found, nothing was sourced"
fi

# Git prompt configuration
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM="verbose"
# CCM prompt configuration
function ccmls()
{
    current_cluster=`[ -f ~/.ccm/CURRENT ] && echo -n '(' && cat ~/.ccm/CURRENT | tr -d '\n' && echo -n ')'`
    no_clusters=`echo -n '(' && ls ~/.ccm/ | egrep -v 'CURRENT|repository' | wc -l | tr -d '\n ' ; echo ')'`
    no_active_cassandra_processes=`echo -n '(' && ps -ef | grep java | grep CassandraDaemon | wc -l | tr -d '\n ' ; echo ')'`
    [ -n "${current_cluster}${no_clusters}" ] && echo -n "ccm:${current_cluster}${no_clusters}${no_active_cassandra_processes}"
}
export PS1='${ret_status}%{$fg_bold[green]%}%p %{$fg[white]%}%n@%M %{$fg[cyan]%}%c %{$fg_bold[yellow]%}$(ccmls)%{$fg_bold[yellow]%} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
$ '

if [ -d $HOME/.rvm/bin ]; then
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

<<<<<<< HEAD
if [[ "$(uname)" == "Darwin" ]]; then
    # We are on Mac OSX

    # Autojump with homebrew
    if [ -f `brew --prefix`/etc/autojump.sh ]; then
        source `brew --prefix`/etc/autojump.sh
    else
        echo "You may want to install autojump from homebrew"
    fi

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
fi

=======
if [ -d $HOME/.gvm/groovy/current/bin ]; then
    PATH=$PATH:$HOME/.gvm/groovy/current/bin
fi

if [ -d $HOME/devhome/app/apache-maven-3.0.3/bin ]; then
    PATH=$PATH:$HOME/devhome/app/apache-maven-3.0.3/bin
fi
>>>>>>> tmp
