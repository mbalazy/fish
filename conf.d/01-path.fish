# fish_user_paths is universal, so these persist; fish_add_path is idempotent
# and skips directories that do not exist.
fish_add_path -m ~/.local/bin
fish_add_path $HOME/bin
fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /Applications/Ghostty.app/Contents/MacOS
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/cmdline-tools/10.0/bin
fish_add_path $HOME/.local/share/go/bin
fish_add_path $HOME/.local/share/go
