Dotfiles
========

Solarized Scheme
----------------

Dowload [solarized_dark_mattes.terminal](/solarized_dark_mattes.terminal), double click, and make it the default in Terminal.app.
The scheme is an adapted version of https://github.com/altercation/solarized/pull/314.
I couldn't get the pre-packaged version that comes with the official Solarized download to work.


Installation
------------

```bash
git clone git://github.com/mattes/dotfiles.git
cd dotfiles
./dotfiles.sh install
```

### Install Essentials

```bash
# bootstrap system
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off
brew install bash bash-completion curl openssl tldr tree watch nmap jq go the_silver_searcher python3

# install ruby
brew install rbenv ruby-build
brew link --force curl
rbenv install 2.3.3 && rbenv global 2.3.3 && rbenv rehash

# install tmux and helpers
brew install tmux
gem install tmuxinator

# install neovim
brew tap neovim/neovim
brew install neovim

# install vim-plug and set up config files
mkdir -p ~/.config
mkdir -p ~/.nvim/sessions
ln -s ~/.nvim ~/.config/nvim
ln -s ~/.nvimrc ~/.config/nvim/init.vim
ln -s "$(which nvim)" "$(dirname $(which nvim))/vi"
pip3 install neovim
curl -fLo ~/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
go get -u github.com/nsf/gocode # needed for go autocomplete
# run `:PlugInstall` when neovim is started for the first time

# install quick look plugin
https://github.com/whomwah/qlstephen
```


How Bash executes its startup files
-----------------------------------

```
Interactive Login Shell: /etc/profile -> ~/.bash_profile -> ~/.bash_login -> ~/.profile ( -> ~/.bash_logout )
Non-Interactive Shell with --login option: see above
Interactive Non-Login Shell: ~/.bashrc
```

Further reading: 

  * [What is an Interactive Shell?](http://www.gnu.org/software/bash/manual/bashref.html#What-is-an-Interactive-Shell_003f) and
  * [more details about bash startup files](http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files).


More Information
----------------

 * dotfiles.org is a place to upload, download, and share your dotfiles.  
   http://dotfiles.org/
 * Your unofficial guide to dotfiles on GitHub.  
   http://dotfiles.github.com/
