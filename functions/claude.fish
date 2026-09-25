# Claude Code: company Team account inside the LittleEngine repos, personal
# Max account everywhere else. Separate config dirs = separate credentials
# and MCP, no logout/login needed. See also claudep / claudec.
function claude
    if string match -q "/Users/mart/repos/littleEngine*" (pwd)
        env CLAUDE_CONFIG_DIR=$HOME/.claude-company python3 $HOME/.claude/scripts/mcp-inherit-worktree.py
        command env CLAUDE_CONFIG_DIR=$HOME/.claude-company claude $argv
    else
        python3 $HOME/.claude/scripts/mcp-inherit-worktree.py
        command claude $argv
    end
end
