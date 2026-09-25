function to-happy --description "Continue last CC session in Happy Coder"
    # Find newest session for current directory from Claude's project data
    set -l encoded_cwd (string replace -a / - (pwd) | string trim -l -c -)
    set -l session_dir "$HOME/.claude/projects/-$encoded_cwd"

    if test -d $session_dir
        set -l latest (ls -t $session_dir/*.jsonl 2>/dev/null | head -1)
        if test -n "$latest"
            set -l session_id (basename $latest .jsonl)
            echo "Resuming CC session: $session_id (from $session_dir)"
            happy --resume $session_id
            return
        end
    end

    echo "No CC session found for "(pwd)". Start fresh with: happy"
end
