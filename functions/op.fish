# Save this as ~/.config/fish/functions/op.fish

function op --description "1Password CLI with lazy-loaded completions"
    # Remove this function to avoid recursion once completions are loaded
    functions -e op
    
    # Start timing
    set -l start_time (date +%s%N)
    
    # Load completions only when first running the command
    if command -q op
        echo "Loading 1Password CLI completions..."
        source (command op completion fish | psub)
        
        # Calculate and display load time
        set -l end_time (date +%s%N)
        set -l load_time (math "($end_time - $start_time) / 1000000") # Convert to milliseconds
        echo "Completions loaded in $load_time ms!"
    end
    
    # Execute the original command with the passed arguments
    command op $argv
end
