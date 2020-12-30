# Add user to hide user from command prompt
export DEFAULT_USER=`whoami`
export HOME=/Users/$DEFAULT_USER

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Terminal color support
export TERM="xterm-256color"

# Zsh spelling correction
setopt CORRECT

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git github docker docker-compose vundle vi-mode tmux npm node themes colored-man-pages colorize zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

# zsh-completions settings
autoload -U compinit && compinit

# Zsh auto-suggestion style
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Zsh source
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# ssh
export SSH_PUB_KEY="~/.ssh/id_rsa.pub"
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Personal Aliases
alias k='tree'
alias ltr='ls -ltr'
alias r='screen -D -R'
alias l='ls -lh'
alias ll='ls -la'
alias zshconfig="atom ~/.zshrc"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias hostsfile="vim /etc/hosts"

# Add personal bin to $PATH and nodenv.
export PATH="/usr/local/Cellar/yarn/1.22.10/bin:/mongodb/bin:$HOME/.nodenv/bin:$HOME/.nodenv/completions/nodenv.zsh:$HOME/.nodenv/shims:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Share commands history
HISTFILE=~/.zsh_history # Set the filename to save history to
HISTSIZE=1000000 # Set your history file to be reasonably huge
HISTTIMEFORMAT="[%F %T %Z]"

# Append, clear, and read history after each command
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Ignore duplicate commands, and commands that start with spaces
HISTCONTROL='ignoreboth'

# temporary
unset GREP_OPTIONS
alias grep='grep --color=auto'

# Z
. `brew --prefix`/etc/profile.d/z.sh

# Initialize nodenv
eval "$(nodenv init -)"
eval $(thefuck --alias)
