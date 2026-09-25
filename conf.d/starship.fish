# Starship: source a cached copy of `starship init fish` instead of spawning
# starship + psub on the first prompt (~15ms). The cache is regenerated when
# the starship binary is newer than it (brew upgrade), `test -nt` is a builtin.
status is-interactive; or exit

set -l cache $HOME/.cache/starship/init.fish
if not test -e $cache; or test (command -s starship) -nt $cache
    mkdir -p (path dirname $cache)
    starship init fish --print-full-init >$cache
end
source $cache
