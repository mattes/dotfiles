function update_dotfiles {
  bash_dir=$(readlinkf ~/.bash)
  (cd $bash_dir/../.. && git pull)
  reload_dotfiles
}