# don't put duplicate lines in the history. 
# See bash(1) section 'HISTORY' for more options
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND='history -a'

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000
