function reload_dotfiles {
  $HOME/dotfiles/build.sh $HOME/dotfiles/src $HOME/dotfiles/home/.dotfiles.sh
  source $HOME/dotfiles/home/.dotfiles.sh
}