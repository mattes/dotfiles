if [[ -e $HOME/.pyenv ]]; then
  RESCUE_PATH=$PATH
  export PATH=$CLEAN_PATH

  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)" > /dev/null
  export PYENV_SHELL=/usr/local/bin/bash

  SHIM_PATH=$PATH:$SHIM_PATH
  export SHIM_PATH=$(echo ${SHIM_PATH/$CLEAN_PATH/} | tr -s :)
  export PATH=$RESCUE_PATH
fi