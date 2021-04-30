if [[ -e $HOME/.goenv ]]; then
  RESCUE_PATH=$PATH
  export PATH=$CLEAN_PATH

  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  eval "$(goenv init -)" > /dev/null
  export GOENV_SHELL=/usr/local/bin/bash
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"

  SHIM_PATH=$PATH:$SHIM_PATH
  export SHIM_PATH=$(echo ${SHIM_PATH/$CLEAN_PATH/} | tr -s :)
  export PATH=$RESCUE_PATH
fi
