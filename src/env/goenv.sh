if [[ -e $HOME/.goenv ]]; then
  export PATH="$HOME/.goenv/bin:$PATH"
  eval "$(goenv init -)" > /dev/null
fi