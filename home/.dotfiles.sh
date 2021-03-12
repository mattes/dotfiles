#!/usr/bin/env bash
# AUTO-GENERATED FILE

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

# /Users/mattes/dotfiles/src/env/go.sh:
if [[ -d "$HOME/go" ]]; then 
  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"
fi



# /Users/mattes/dotfiles/src/env/python.sh:
export PYTHONDONTWRITEBYTECODE=1


# /Users/mattes/dotfiles/src/env/timezone.sh:
export TZ=America/Los_Angeles


# /Users/mattes/dotfiles/src/env/rbenv.sh:
if [[ -e $HOME/.rbenv ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)" > /dev/null
fi


# /Users/mattes/dotfiles/src/env/prompt.sh:
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*$bits"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  echo "$bits"
}

export PS1="\[\033[0;34m\]\W \[\033[0;90m\]\`parse_git_dirty\`\$\[\033[0m\] "


# /Users/mattes/dotfiles/src/env/editor.sh:
export EDITOR='vi'


# /Users/mattes/dotfiles/src/env/history.sh:
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND='history -a'

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000


# /Users/mattes/dotfiles/src/env/pyenv.sh:
if [[ -e $HOME/.pyenv ]]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)" > /dev/null
fi


# /Users/mattes/dotfiles/src/env/ansible.sh:
if command -v ansible &>/dev/null; then
  export ANSIBLE_NOCOWS=1
fi


# /Users/mattes/dotfiles/src/env/lang.sh:
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# /Users/mattes/dotfiles/src/env/window.sh:
shopt -s checkwinsize


# /Users/mattes/dotfiles/src/env/nodenv.sh:
if [[ -e $HOME/.nodenv ]]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)" > /dev/null
fi


# /Users/mattes/dotfiles/src/env/shell.sh:
export SHELL=bash



# /Users/mattes/dotfiles/src/env/term.sh:
export TERM="xterm-256color"


# /Users/mattes/dotfiles/src/functions/reload_dotfiles.sh:
function reload_dotfiles {
  $HOME/dotfiles/build.sh $HOME/dotfiles/src $HOME/dotfiles/home/.dotfiles.sh
  source $HOME/dotfiles/home/.dotfiles.sh
}


# /Users/mattes/dotfiles/src/functions/quickcd.sh:
function qccd {
  pwd | pbcopy
}

function qcd {
  cd `pbpaste`
}


# /Users/mattes/dotfiles/src/functions/lazy_extract.sh:
function lazy_extract {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjfv $1;;
            *.tar.gz)    tar xzfv $1;;
            *.tar.xz)    tar xJfv $1;;
            *.bz2)       bunzip2 $1;;
            *.rar)       rar x $1;;
            *.gz)        gunzip $1;;
            *.tar)       tar xfv $1;;
            *.tbz2)      tar xjfv $1;;
            *.tgz)       tar xzfv $1;;
            *.zip)       unzip $1;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1;;
            *)           echo "'$1' cannot be extracted via extract()";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}


# /Users/mattes/dotfiles/src/functions/create_token.sh:
function create_token {
  openssl rand -hex 3 | tr -d '\n' | pbcopy
}


# /Users/mattes/dotfiles/src/functions/tmp.sh:
function tmp {
  num=1
  while [[ -e "/tmp/t$num" ]]; do
    let num++
  done
  mkdir -p "/tmp/t$num" && cd $_
}


# /Users/mattes/dotfiles/src/aliases/postgres.sh:
alias psql='docker run -it --rm --network host postgres:11 psql'
alias pcreatedb='docker run -it --rm --network host postgres:11 createdb'


# /Users/mattes/dotfiles/src/aliases/ip.sh:
alias wanip="curl https://api4.my-ip.io/ip"
alias wanip4="curl https://api4.my-ip.io/ip"
alias wanip6="curl https://api6.my-ip.io/ip"


# /Users/mattes/dotfiles/src/aliases/timestamp.sh:
alias timestamp='date +%s'


# /Users/mattes/dotfiles/src/aliases/cd.sh:
alias ..='cd ..'
alias ...='cd ../..'


# /Users/mattes/dotfiles/src/aliases/git.sh:
alias gitc='git commit -am'
alias gits='git status'
alias gita='git add --all .'
alias gitp='git push'
alias gitcr="git commit -am 'Update Readme' && git push"
alias gitl="git log --pretty=format:'%C(green)%h%d%Creset - %an: %s (%cr)'"


# /Users/mattes/dotfiles/src/aliases/ag.sh:
alias ag='ag --color-line-number="1;90"'
alias ag1='ag --depth=1'
alias ag2='ag --depth=2'
alias ag3='ag --depth=3'



# /Users/mattes/dotfiles/src/aliases/curl.sh:
alias curlh='curl -sS -o /dev/null -D -'


# /Users/mattes/dotfiles/src/aliases/ls.sh:
alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -laFhG'


# /Users/mattes/dotfiles/src/aliases/docker.sh:
alias dops='docker ps'


# /Users/mattes/dotfiles/src/aliases/grep.sh:
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
