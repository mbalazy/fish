# Everything else lives in conf.d/ (loaded alphabetically before this file)
# and functions/ (autoloaded). Key bindings mode is universal:
#   set -U fish_key_bindings fish_vi_key_bindings
set fish_greeting

# Ctrl-T: attach to tmux, or start it
bind \ct 'commandline -r "tmux attach 2>/dev/null; or tmux"; commandline -f execute'
