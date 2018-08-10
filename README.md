Dotfiles
========

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
brew install bash bash-completion git curl openssl tldr tree watch nmap jq go the_silver_searcher python3 reattach-to-user-namespace

# install quick look plugin
https://github.com/whomwah/qlstephen

# install ruby
brew install rbenv ruby-build
brew link --force curl
rbenv install 2.3.3 && rbenv global 2.3.3 && rbenv rehash

# install python
brew install pyenv

# install node
brew install nodenv

# install tmux and helpers
brew install tmux

# install vim 
brew install vim --with-lua

# install vim-plug and set up config files
mkdir -p ~/.vim/sessions
ln -s "$(which vim)" /usr/local/bin/vi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
go get -u github.com/nsf/gocode # needed for go autocomplete
# run `:PlugInstall` when vim is started for the first time

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
prefix + I # to install plugins
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
