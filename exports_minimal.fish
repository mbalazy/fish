export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export GOPATH=$HOME/.local/share/go
export MYVIMRC=/Users/mart/.config/nvim/init.lua

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

export APP_ENV=production
export MANPAGER='lvim +Man!'
export LESS='iMRS'

# Defer loading OpenAI key until needed - this saves time by avoiding 1Password dependency
function get_openai_key
    set -l cache_file ~/.openai_key_cache
    set -l cache_max_age 604800  # 1 week in seconds (7*24*60*60)
    
    # Check if we have a valid cached key
    if test -f $cache_file
        set -l file_age (math (date +%s) - (stat -f %m $cache_file))
        if test $file_age -lt $cache_max_age
            cat $cache_file
            return 0
        end
    end
    
    # No valid cache, get a fresh key
    if command -q op
        set -l api_key (op read op://Personal/Openai/neovim_api_key 2>/dev/null)
        if test -n "$api_key"
            # Cache the key
            echo $api_key > $cache_file
            chmod 600 $cache_file
            echo $api_key
            return 0
        else
            echo "Failed to retrieve API key from 1Password" >&2
            return 1
        end
    else
        echo "1Password CLI not found" >&2
        return 1
    end
end

# Function to load OpenAI key only when needed
function openai_init
    set -gx OPENAI_API_KEY (get_openai_key)
    echo "OpenAI API key loaded"
end

# For fish/lazygit
export XDG_CONFIG_HOME="$HOME/.config"
