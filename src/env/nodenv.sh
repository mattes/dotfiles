if [[ -e $HOME/.nodenv ]]; then
  RESCUE_PATH=$PATH
  export PATH=$CLEAN_PATH

  export NODENV_ROOT="$HOME/.nodenv"
  export PATH="$NODENV_ROOT/bin:$PATH"
  eval "$(nodenv init -)" > /dev/null
  export NODENV_SHELL=/usr/local/bin/bash

  SHIM_PATH=$PATH:$SHIM_PATH
  export SHIM_PATH=$(echo ${SHIM_PATH/$CLEAN_PATH/} | tr -s :)
  export PATH=$RESCUE_PATH
fi