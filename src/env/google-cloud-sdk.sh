if [[ -d $HOME/google-cloud-sdk ]]; then
  export TOOL_PATH=$TOOL_PATH:$HOME/google-cloud-sdk/bin
  source "$HOME/google-cloud-sdk/completion.bash.inc"
fi