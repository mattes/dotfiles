function reload_dotfiles {
  (cd $HOME/dotfiles/bash && . build.sh)
  source $HOME/dotfiles/bash/cached.sh
}
