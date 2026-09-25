function op --description "1Password CLI with lazy-loaded completions"
    functions -e op
    if command -q op
        command op completion fish | source
    end
    command op $argv
end
