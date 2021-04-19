function tmux_run {
  /usr/local/bin/tmux attach-session || /usr/local/bin/tmux new-session
}