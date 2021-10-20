ZSH_THEME="robbyrussell"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# plugin
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration
export proxy=http://$(grep nameserver /etc/resolv.conf | awk '{print $2}'):7890
export http_proxy=$proxy
export https_proxy=$proxy
export GOPATH=$HOME/.go
export PATH=/usr/sbin:/usr/lib/wsl:$HOME/.go/bin:$HOME/.deno/bin

# aliases
alias p="export http_proxy=$proxy && export https_proxy=$proxy"
alias up="unset http_proxy && unset https_proxy"