function reload_dotfiles {
  (cd $HOME/dotfiles/home/bash && . build.sh)
  source $HOME/dotfiles/home/bash/cached.sh
}
