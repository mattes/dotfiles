function reload_dotfiles {
  . ~/.bash/build-cache.sh
  unset -f shell_is_interactive
  source ~/.bashrc
}