# dotfiles

## Install

```
git clone git://github.com/mattes/dotfiles.git
cd dotfiles
./install.sh
```


## How Bash executes its startup files

```
Interactive Login Shell: /etc/profile -> ~/.bash_profile -> ~/.bash_login -> ~/.profile ( -> ~/.bash_logout )
Non-Interactive Shell with --login option: see above
Interactive Non-Login Shell: ~/.bashrc
```

Further reading: 

  * [What is an Interactive Shell?](http://www.gnu.org/software/bash/manual/bashref.html#What-is-an-Interactive-Shell_003f) and
  * [more details about bash startup files](http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files).

