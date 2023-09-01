# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

starship init fish | source
zoxide init fish | source

set fish_greeting

source ./aliases
source ./exports
source ./path
