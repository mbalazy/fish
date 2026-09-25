function codex-le --wraps codex --description 'Codex with the Little Engine ChatGPT account'
    command env -u OPENAI_API_KEY -u CODEX_API_KEY -u CODEX_ACCESS_TOKEN -u CODEX_SQLITE_HOME \
        CODEX_HOME="$HOME/.codex-le" "$HOME/.local/bin/codex" $argv
end
