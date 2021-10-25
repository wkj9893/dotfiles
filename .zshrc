ZSH_THEME="robbyrussell"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# plugin
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration
export LANG=en_US.UTF-8
export EDITOR=vim
export http_proxy=http://localhost:7890
export https_proxy=http://localhost:7890
export GOPATH=$HOME/.go
export PATH=/usr/sbin:/usr/lib/wsl:$HOME/.go/bin:$HOME/.deno/bin