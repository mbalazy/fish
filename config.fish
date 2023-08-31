# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

starship init fish | source
set fish_greeting

# alias la="lsd -la"
alias lg="lazygit"
alias clr="clear"

alias vs="lvim +Session"
alias v="lvim"
alias tm="tmux"
alias tms="tmux attach-session -t"
alias tmn="tmux new -s"
alias rr=" open -a Simulator && xcrun simctl boot 34B3DDED-D5B5-4788-A7AF-F7954E09D5AC && xcrun simctl launch 34B3DDED-D5B5-4788-A7AF-F7954E09D5AC com.revelator.originalworks"

alias ff='fd --type f --hidden --exclude .git | fzf-tmux --reverse | xargs lvim'
# alias ff='fd --type f --hidden --exclude .git | fzf-tmux --reverse | xargs lvim'

alias lc="yes | lerna clean && lerna bootstrap"

