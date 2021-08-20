# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG="en_US.UTF-8"
export EDITOR="vim"
export proxy="$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):7890"
export http_proxy="$proxy"
export https_proxy="$proxy"
export GOPATH="$HOME/.go"
export PATH="$PATH:$(go env GOPATH)/bin"
