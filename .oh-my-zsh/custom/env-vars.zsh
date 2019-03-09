# Setup PATH
PATH=$HOME/.dotfiles/bin:$PATH

# Go things
#export GOROOT=$HOME/Code
export GOPATH=$HOME/Code
export PATH=$GOPATH/bin:$PATH

# Exports
export EDITOR='code --wait'
# export JAVA_HOME="$(/usr/libexec/java_home)"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export CDPATH=.:$GOPATH/src/git.amfamlabs.com:$GOPATH/src
