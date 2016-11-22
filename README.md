My dotfiles
===========

Terminal Schemes
 * [smyck](https://github.com/mattes/Smyck-Color-Scheme)
 * [vim-monokai](https://github.com/sickill/vim-monokai)

Installation
============

```bash
git clone git://github.com/mattes/dotfiles.git
cd dotfiles
./dotfiles.sh install

# install https://github.com/mattes/Smyck-Color-Scheme
```

How Bash executes its startup files
===================================

```
Interactive Login Shell: /etc/profile -> ~/.bash_profile -> ~/.bash_login -> ~/.profile ( -> ~/.bash_logout )
Non-Interactive Shell with --login option: see above
Interactive Non-Login Shell: ~/.bashrc
```

Further reading: 
[What is an Interactive Shell?](http://www.gnu.org/software/bash/manual/bashref.html#What-is-an-Interactive-Shell_003f) and
[more details about bash startup files](http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files).

Fresh Mac OS X Install
======================

For what it's worth: A fresh Mac OS X installation comes with an /etc/profile file only. No other files are found (see above).

/etc/profile
````
# System-wide .profile for sh(1)

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
  [ -r /etc/bashrc ] && . /etc/bashrc
fi
````

/etc/bashrc
````
# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
  local SEARCH=' '
  local REPLACE='%20'
  local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
  printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi
```


More Information
================

 * dotfiles.org is a place to upload, download, and share your dotfiles.  
   http://dotfiles.org/
 * Your unofficial guide to dotfiles on GitHub.  
   http://dotfiles.github.com/
