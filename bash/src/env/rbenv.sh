# installed to ~/.rbenv or /usr/local/bin (with brew)
[[ -d "$HOME/.rbenv" && ! -e /usr/local/bin/rbenv ]] && export PATH="$HOME/.rbenv/bin:$PATH"

# init
[[ -d "$HOME/.rbenv" ]] && eval "$(rbenv init -)" > /dev/null

