# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/wanglk/.oh-my-zsh"
export TERM=xterm-256color

# themes "agnoster" "af-magic"
ZSH_THEME="agnoster"

# plugins
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  autojump
)

# alias
alias ips='ifconfig | grep -Eo '\''inet (addr:)?172\.([0-9]*\.){2}[0-9]*'\'' | grep -Eo '\''([0-9]*\.){3}[0-9]*'\'' | grep -v '\''127.0.0.1'\'
alias z='zsh'
alias o='open'
alias h='history'
alias c='clear'
# yarn
alias y='yarn'
alias yd='yarn dev'
alias ys='yarn start'
alias yst='yarn storybook'
# vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
# tmux
alias t='tmux'
alias tl='t ls'
alias tk='t kill-session -t'
# fastroute
alias ti="fa trace"
alias tit="fa --inner trace"
# tools
alias ls="exa --icons"
alias ll="exa --icons -l"
alias cat="bat"

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.8/lib"
export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

