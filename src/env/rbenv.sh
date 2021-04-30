if [[ -e $HOME/.rbenv ]]; then
  RESCUE_PATH=$PATH
  export PATH=$CLEAN_PATH

  export RBENV_ROOT="$HOME/.rbenv"
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)" > /dev/null
  export RBENV_SHELL=/usr/local/bin/bash

  SHIM_PATH=$PATH:$SHIM_PATH
  export SHIM_PATH=$(echo ${SHIM_PATH/$CLEAN_PATH/} | tr -s :)
  export PATH=$RESCUE_PATH
fi