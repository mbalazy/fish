set fish_greeting

source $HOME/.config/fish/exports
source $HOME/.config/fish/path
source $HOME/.config/fish/aliases

starship init fish | source
zoxide init fish | source
op completion fish | source

set -g fish_key_bindings fish_vi_key_bindings

# <C-t>
bind \ct 'tmux attach || tmux ^M'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# rvm
# rvm default
