if [[ -e $HOME/.nodenv/bin ]]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)" > /dev/null
fi
