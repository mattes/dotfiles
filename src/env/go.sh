if [[ -d "$HOME/go" ]]; then 
  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"
fi
