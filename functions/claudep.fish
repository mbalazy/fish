# Force the personal (Max) account regardless of directory, e.g. when the
# Team plan runs out of usage inside littleEngine.
function claudep
    python3 $HOME/.claude/scripts/mcp-inherit-worktree.py
    command claude $argv
end
