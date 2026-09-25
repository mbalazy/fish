function codexp --wraps codex --description 'Codex with the personal account in any directory'
    command env -u CODEX_SQLITE_HOME CODEX_HOME="$HOME/.codex" "$HOME/.local/bin/codex" $argv
end
