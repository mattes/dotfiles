if [[ -e $HOME/.pyenv ]]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)" > /dev/null
fi