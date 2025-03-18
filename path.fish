#!/bin/sh

fish_add_path -m ~/.local/bin
fish_add_path $HOME/.cargo/bin

# fish_add_path (find "$HOME/.sdkman/candidates/maven/current/bin" -maxdepth 0)
# fish_add_path (find "$HOME/.sdkman/candidates/kotlin/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/java/current/bin" -maxdepth 0)
# fish_add_path (find "$HOME/.sdkman/candidates/gradle/current/bin" -maxdepth 0)

fish_add_path $HOME/.rvm/bin
fish_add_path /opt/homebrew/bin

fish_add_path /opt/homebrew/sbin

fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/cmdline-tools/10.0/bin

fish_add_path /.cargo/bin
fish_add_path /.local/share/go/bin
fish_add_path /.local/share/go

# $HOME/.local/share/nvim/mason/bin
