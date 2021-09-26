# oh-my-zsh
export ZSH="/root/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration
export LANG=en_US.UTF-8
export EDITOR=vim
export proxy=http://$(grep nameserver /etc/resolv.conf | awk '{print $2}'):7890
export http_proxy=$proxy
export https_proxy=$proxy
export GOPATH=$HOME/.go
export PATH=$PATH:$(go env GOPATH)/bin

# aliases
alias vi=nvim
alias vim=nvim
alias start=wsl-start
alias p="export http_proxy=$proxy && export https_proxy=$proxy"
alias up="unset http_proxy && unset https_proxy"
