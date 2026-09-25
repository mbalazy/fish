# Force the company (Team) account regardless of directory.
function claudec
    env CLAUDE_CONFIG_DIR=$HOME/.claude-company python3 $HOME/.claude/scripts/mcp-inherit-worktree.py
    command env CLAUDE_CONFIG_DIR=$HOME/.claude-company claude $argv
end
