#!/bin/sh

alias la="lsd -la"
alias lg="lazygit"
alias git-apply="pbpaste | git apply"

alias clr="clear"

alias v="lvim"

alias tm="tmux"
alias tms="tmux attach-session -t"
alias tmn="tmux new -s"

alias sim="open -a Simulator && xcrun simctl boot ED0E9F58-61E3-4413-9A4C-66DE70576CCD && xcrun simctl launch ED0E9F58-61E3-4413-9A4C-66DE70576CCD com.revelator.originalworks"
alias runios="open -a Simulator && xcrun simctl launch ED0E9F58-61E3-4413-9A4C-66DE70576CCD com.revelator.originalworks"

alias ff='fd --type f --hidden --exclude .git | fzf-tmux --reverse | xargs lvim'

alias lc="yes | lerna clean && lerna bootstrap"
alias kill-docker="docker kill \$(docker ps -q) && docker rm \$(docker ps -a -q)"
