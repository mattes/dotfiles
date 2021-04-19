if [[ -e $HOME/.pyenv ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)" > /dev/null
fi