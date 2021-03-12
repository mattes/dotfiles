if [[ -e $HOME/.nodenv ]]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)" > /dev/null
fi