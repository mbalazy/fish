# Environment. Secrets are NOT here: they live in universal variables
# (set -Ux, stored in fish_variables, which is gitignored). This repo is public.

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
set -gx MYVIMRC $HOME/.config/nvim/init.lua
set -gx GOPATH $HOME/.local/share/go

set -gx ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

set -gx DOTNET_ROOT /opt/homebrew/opt/dotnet@8/libexec
set -gx ASPNETCORE_ENVIRONMENT Development

set -gx MANPAGER 'nvim +Man!'
set -gx LESS iMRS

set -gx OLLAMA_API_BASE http://127.0.0.1:11434
set -gx ATLASSIAN_BASE_URL https://tellmefables.atlassian.net/
set -gx ATLASSIAN_EMAIL marcin.bal@protem.solutions

# Skip the system gitconfig lookup. Starship (gitoxide) locates it by spawning
# `git` from PATH, which on macOS is the Xcode shim (~25ms per prompt). The
# system file only holds credential.helper=osxkeychain + init.defaultBranch,
# both already set in ~/.gitconfig.
set -gx GIT_CONFIG_NOSYSTEM 1
