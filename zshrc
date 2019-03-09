ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
ZSH_THEME="avit"
source $ZSH/oh-my-zsh.sh

# DISABLE_AUTO_TITLE="true"
set -g default-terminal "xterm"

# Plugins
plugins=(aws keybase docker pip notify ssh-agent)
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Turn off autocorrect
unsetopt correct_all

# env managment tool
case `uname` in
  Darwin)
    eval "$(rbenv init -)"
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    # sets the tab title to current dir
    precmd() {
      echo -ne "\e]1;${PWD##*/}\a"
    }
  ;;
  Linux)
    # commands for Linux go here
  ;;
esac

# autocomplete
autoload -U +X bashcompinit && bashcompinit
