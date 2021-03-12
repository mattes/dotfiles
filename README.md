# dotfiles for Mac

## Install

```
cd $HOME
git clone git://github.com/mattes/dotfiles.git
cd dotfiles
./install.sh
```

## Startup files

```
Invoked as an interactive login shell, or with --login
/etc/profile
/etc/bashrc
/etc/bashrc_Apple_Terminal (/etc/bashrc_$TERM_PROGRAM)
~/.bash_profile
~/.bash_login
~/.profile
~/.bash_logout

Invoked as an interactive non-login shell
~/.bashrc

Invoked non-interactively
$BASH_ENV

Invoked with name sh
/etc/profile
/etc/bashrc
/etc/bashrc_Apple_Terminal (/etc/bashrc_$TERM_PROGRAM)
~/.profile
```

Read more here: https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html