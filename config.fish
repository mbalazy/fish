set fish_greeting

source $HOME/.config/fish/exports_minimal.fish
source $HOME/.config/fish/path.fish
source $HOME/.config/fish/aliases.fish

function starship_init --on-event fish_prompt
    # Only run this once
    functions -e starship_init
    # Initialize starship
    starship init fish | source
end

function z --wraps zoxide
    functions -e z
    zoxide init fish | source
    # Now run the command
    z $argv
end

function zi --wraps zoxide
    functions -e zi
    zoxide init fish | source
    # Now run the command
    zi $argv
end

# Already lazy-loaded by the op function
# op completion fish | source

# Lazy-load FNM (Fast Node Manager) (saves ~12,400ms)
function fnm --description "Fast Node Manager with lazy loading"
    functions -e fnm

    # Load FNM environment
    eval (command fnm env --use-on-cd | string replace 'set -gx' 'set -gx --export')
    
    # Run the fnm command
    command fnm $argv
end

# Create autoload script for node-related commands
function node
    functions -e node
    # Load FNM environment
    eval (command fnm env --use-on-cd | string replace 'set -gx' 'set -gx --export')
    # Run the command
    command node $argv
end

function npm
    functions -e npm
    # Load FNM environment
    eval (command fnm env --use-on-cd | string replace 'set -gx' 'set -gx --export')
    # Run the command
    command npm $argv
end

# SDKMAN lazy-loading
function sdk --description "SDKMAN with lazy loading"
    bash -c "source '$HOME/.sdkman/bin/sdkman-init.sh'; sdk $argv[1..]"
end

set -g fish_key_bindings fish_vi_key_bindings

# <C-t>
bind \ct 'tmux attach || tmux ^M'
