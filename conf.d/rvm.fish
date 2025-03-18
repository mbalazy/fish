# Set initial Ruby paths
set -gx PATH $HOME/.rvm/rubies/ruby-3.2.0/bin $PATH
set -gx GEM_HOME $HOME/.rvm/gems/ruby-3.2.0
set -gx GEM_PATH $HOME/.rvm/gems/ruby-3.2.0
set -gx PATH $GEM_HOME/bin $PATH

# Function to load RVM only when needed
function load_rvm
    # Check if RVM is already loaded
    if not type -q __rvm_loaded
        bass source ~/.rvm/scripts/rvm >/dev/null 2>&1
        set -g __rvm_loaded 1
    end
end

# Create wrapper functions for Ruby commands
function rvm
    load_rvm
    command rvm $argv
end

function ruby
    load_rvm
    command ruby $argv
end

function gem
    load_rvm
    command gem $argv
end

function bundle
    load_rvm
    command bundle $argv
end

function rails
    load_rvm
    command rails $argv
end
