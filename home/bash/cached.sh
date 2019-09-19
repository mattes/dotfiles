# AUTO GENERATED FILE - DO NOT CHANGE
# Change files in src directory instead.


# reset $PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/snap/bin"



# docker.sh
function docker_container_ip4 {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1
}

function docker_exec {
  docker exec -it $1 bash
}

function docker_container_ips {
  docker inspect --format='{{.NetworkSettings.IPAddress}}  {{printf "%.12v" .Id}}  {{.Name}}  {{.Config.Image}}' $(docker ps -q)
}

# gcloud_ssh.sh
function gcloud_ssh {
  if [[ ! -e "$HOME/.ssh/google_compute_engine_projects" ]]; then
    echo "Missing ~/.ssh/google_compute_engine_projects file"
    exit 1
  fi

  if [[ ! -e "$HOME/.ssh/google_compute_engine" ]]; then
    echo "Missing ~/.ssh/google_compute_engine cert"
    exit 1
  fi

  if [[ ! -e "$HOME/.ssh/google_compute_engine.pub" ]]; then
    echo "Missing ~/.ssh/google_compute_engine.pub"
    exit 1
  fi

  while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ "$line" != "" ]]; then
      cmd="gcloud compute config-ssh --project $line"
      echo $cmd
      $cmd
    fi
  done < "$HOME/.ssh/google_compute_engine_projects"
}



# gittree.sh
# recursively traverse directory tree for git repositories, run git command
# e.g.
#   gittree status
#   gittree diff
function gittree {
  if [ $# -lt 1 ]; then
    echo "Usage: gittree <command>"
    return 1
  fi

  for gitdir in $(find . -type d -name .git); do
    # Display repository name in blue
    repo=$(dirname $gitdir)
    echo -e "\033[34m$repo\033[0m"

    # Run git command in the repositories directory
    cd $repo && git $@
    ret=$?

    # Return to calling directory (ignore output)
    cd - > /dev/null

    # Abort if cd or git command fails
    if [ $ret -ne 0 ]; then
      return 1
    fi

    echo
  done
}

# lazy_extract.sh
# lazy man extract - example: ex tarball.tar
function lazy_extract {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjfv $1        ;;
            *.tar.gz)    tar xzfv $1     ;;
            *.tar.xz)    tar xJfv $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       rar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xfv $1        ;;
            *.tbz2)      tar xjfv $1      ;;
            *.tgz)       tar xzfv $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# onchange.sh
# brew install fswatch
function onchange { 
  fswatch -0 --event Updated . | xargs -0 -n1 -I{} $@
  sleep 1
}


# quickcd.sh
function qccd {
  pwd | pbcopy
}

function qcd {
  cd `pbpaste`
}


# readlinkf.linux.sh
function readlinkf {
  readlink -f $1
}

# reload_dotfiles.sh
function reload_dotfiles {
  (cd $HOME/dotfiles/home/bash && . build.sh)
  source $HOME/dotfiles/home/bash/cached.sh
}


# rewrite_goimports.sh
function rewrite_goimports {
  find . -not -path .git -type f -print0 | xargs -0 sed -i "s;$1;$2;g"
}


# shell_is_interactive.sh
function shell_is_interactive {
  case $- in
  *i*)
    return 0
    ;;
  *)
    return 1
    ;;
  esac
}


# tmp.sh
function tmp {
  num=1
  while [[ -e "/tmp/t$num" ]]; do
    let num++
  done
  mkdir -p "/tmp/t$num" && cd $_
}

# untmp.sh
function untmp {
  tmp_path=$(pwd)
  tmp_dirname=$(basename $tmp_path)
  timestamp=$(date +%s)

  if [[ ! -d "$HOME/tmp/" ]]; then
    mkdir "$HOME/tmp/"
  fi

  if [[ $tmp_path == /tmp/* ]]; then
    mv "$tmp_path" "$HOME/tmp/$tmp_dirname-$timestamp"
    cd "$HOME/tmp/$tmp_dirname-$timestamp"
  fi
}


# youtube.sh
function youtube_download {
  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o "$1.mp4" https://www.youtube.com/watch?v=$1
  ffmpeg -i "$1.mp4" -c copy -an "$1-no-sound.mp4"
}



# ag.sh
alias ag='ag --color-line-number="1;90"'
alias ag1='ag --depth=1'
alias ag2='ag --depth=2'
alias ag3='ag --depth=3'


# cddev.sh
alias cddev='cd $HOME && ls'


# cdgo.sh
alias cdgo='cd $HOME/go/src && ls'


# cd.sh
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# curl.sh
alias curlh='curl -sS -o /dev/null -D -'


# docker.sh
alias docker_rma='docker rm -f $(docker ps -aq)'
alias docker_rmia='docker rmi -f $(docker images -q)'
alias dops='docker ps'
alias doex='docker_exec'
alias doip='docker_container_ip4'
alias doips='docker_container_ips'
alias doubuntu='docker run -it --rm ubuntu:xenial bash'


# dstat.sh
alias ddstat='dstat --time --load --cpu --mem --disk --net --tcp --udp --unix'


# git.sh
alias gitc='git commit -am'
alias gitcn='git commit -n -am'
alias gitcs='git commit -s -am'
alias gits='git status'
alias gita='git add --all .'
alias gitp='git push'
alias gitcr="git commit -am 'Update Readme' && git push"
alias gitl="git log --pretty=format:'%C(green)%h%d%Creset - %an: %s (%cr)'"
alias gitr="git pull --rebase origin"


# grep.sh
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# ip.sh
alias wanip="curl https://v4.ifconfig.co"
alias wanip4="curl https://v4.ifconfig.co"
alias wanip6="curl https://v6.ifconfig.co"

# @todo
# alias lanip=...

# ls.sh
alias ls='ls -F --color'
alias la='ls -aF --color'
alias ll='ls -laFh --color'

# # some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'


# alias ls='ls --color=auto'
# alias dir='dir --color=auto'
# alias vdir='vdir --color=auto'


# postgres.sh
alias psql='docker run -it --rm --network host postgres:11 psql'
alias createdb='docker run -it --rm --network host postgres:11 createdb'


# timestamp.sh
alias timestamp='date +%s'

# token.sh
alias createtoken="openssl rand -hex 3 | tr -d '\n' | pbcopy"


# ansible.sh
[[ -e /usr/local/bin/ansible ]] && export ANSIBLE_NOCOWS=1

# bash_completion.sh
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# editor.sh
export EDITOR='vi'


# esp32.sh
if [[ -e /usr/local/opt/xtensa-esp32-elf/bin ]]; then
  export PATH=$PATH:/usr/local/opt/xtensa-esp32-elf/bin
fi

if [[ -e /usr/local/opt/esp-idf ]]; then
  export IDF_PATH=/usr/local/opt/esp-idf
fi


# go_appengine.sh
[[ -e $HOME/go_appengine ]] && export PATH=$PATH:$HOME/go_appengine


# golang.sh
[[ -d "$HOME/go" ]] && export GOPATH="$HOME/go" && export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin" && export GO111MODULE=on


# google-cloud-sdk.sh
[[ -d $HOME/google-cloud-sdk ]] && source "$HOME/google-cloud-sdk/path.bash.inc" && source "$HOME/google-cloud-sdk/completion.bash.inc"

# history.sh
# don't put duplicate lines in the history. 
# See bash(1) section 'HISTORY' for more options
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND='history -a'

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000


# lang.sh
[[ ! $LC_ALL ]] && export LC_ALL=en_US.UTF-8
[[ ! $LANG ]]  && export LANG=en_US.UTF-8

# lesspipe.sh
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# node.sh
if [[ -e $HOME/.nodenv/bin ]]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)" > /dev/null
fi


# prompt.sh
#function parse_git_branch {
#  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
#  if [ ! "${BRANCH}" == "" ]
#  then
#  STAT=`parse_git_dirty`
#    echo " [${BRANCH}${STAT}]"
#  else
#    echo ""
#  fi
#}

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


# pyenv.sh
if [[ -e $HOME/.pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)" > /dev/null
fi


# python.sh
export PYTHONDONTWRITEBYTECODE=1


# rbenv.sh
# installed to ~/.rbenv or /usr/local/bin (with brew)
[[ -d "$HOME/.rbenv" && ! -e /usr/local/bin/rbenv ]] && export PATH="$HOME/.rbenv/bin:$PATH"

# init
[[ -d "$HOME/.rbenv" ]] && eval "$(rbenv init -)" > /dev/null



# shell.sh
export SHELL=/bin/bash


# term.sh
export TERM="xterm-256color"


# timezone.sh
TZ=America/Los_Angeles


# window.sh
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# yarn.sh
[[ -e /usr/local/bin/yarn ]] && export PATH="$PATH:`yarn global bin`"


