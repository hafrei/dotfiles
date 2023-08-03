#unalias run-help
#autoload run-help
HELPDIR=/usr/local/share/zsh/help

setopt NO_SHARE_HISTORY

prompt fire red magenta blue white white white

bindkey '^r' history-incremental-search-backward

zstyle ':prezto:load' pmodule 'environment' 'terminal'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'

if test -f $HOME/.zshrc-local; then
	source $HOME/.zshrc-local
fi

alias python="nix-shell -p python3"
alias ls="lsd"

[ -f $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ] && . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
