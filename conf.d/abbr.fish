abbr -a la "lsd -la"
abbr -a lg lazygit
abbr -a git-apply "pbpaste | git apply"

abbr -a clr clear

abbr -a v nvim
abbr -a vs "nvim +SessionLoad"

abbr -a tm tmux
abbr -a tms "tmux attach-session -t"
abbr -a tmn "tmux new -s"

abbr -a ff "fd --type f --hidden --exclude .git | fzf-tmux --reverse | xargs nvim"

abbr -a kill-docker 'docker kill (docker ps -q) && docker rm (docker ps -a -q)'

# Claude Code / Codex launchers
abbr -a cc 'claude --permission-mode auto'
abbr -a ccb 'claude --dangerously-skip-permissions'
abbr -a cx "codex --dangerously-bypass-approvals-and-sandbox"
abbr -a cx-le "codex-le --dangerously-bypass-approvals-and-sandbox"
abbr -a cxp "codexp --dangerously-bypass-approvals-and-sandbox"
