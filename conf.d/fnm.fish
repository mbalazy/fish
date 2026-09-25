# fnm (Fast Node Manager), lazy. Eager `fnm env` costs ~15-25ms per shell.

function __fnm_load
    # Drop every lazy wrapper FIRST: `fnm env` output ends with a call to
    # _fnm_autoload_hook -> `fnm use`, and if `fnm` is still the wrapper it
    # re-enters __fnm_load (fnm env x2, fnm use x3 per shell).
    functions -e fnm node npm yarn npx
    # Quiet the "Using Node vX" line the hook prints on every new tab.
    set -gx FNM_LOGLEVEL quiet
    # The sourced output already runs _fnm_autoload_hook, which applies
    # .nvmrc / .node-version in cwd.
    command fnm env --use-on-cd | source
end

function fnm --description "Fast Node Manager with lazy loading"
    __fnm_load
    command fnm $argv
end

function node
    __fnm_load
    command node $argv
end

function npm
    __fnm_load
    command npm $argv
end

function yarn
    __fnm_load
    command yarn $argv
end

function npx
    __fnm_load
    command npx $argv
end

# fnm-lite: put the .nvmrc / .node-version node on PATH without spawning fnm.
# Real fnm still lazy-loads on the first fnm/node/npm call and takes over.
function __fnm_lite --on-variable PWD
    status is-command-substitution; and return
    functions -q _fnm_autoload_hook; and return   # real fnm loaded, it owns PATH
    set -l f
    test -f .node-version; and set f .node-version
    test -f .nvmrc; and set f .nvmrc
    test -z "$f"; and return
    read -l want <$f
    set want v(string trim -l -c v (string trim $want))
    set -l base "$HOME/Library/Application Support/fnm/node-versions"
    set -l dirs $base/$want/installation/bin $base/$want.*/installation/bin
    set -l dir (path filter -d $dirs)[-1]
    test -n "$dir"; or return
    set -l keep
    for p in $PATH
        string match -q "$base/*" -- $p; or set -a keep $p
    end
    set -gx PATH $dir $keep
end
__fnm_lite

# Node version for the prompt, computed with builtins only (no node/sh spawn):
# fnm's per-version dir has the version in its path. Starship reads it via the
# env_var module. Set only in dirs with a node project marker, like starship's
# detect_files would; cleared elsewhere. Re-run on PATH change so `fnm use`
# is reflected too.
function __node_ver --on-variable PWD --on-variable PATH
    status is-command-substitution; and return
    if test -f package.json; or test -f .nvmrc; or test -f .node-version
        set -l bin (command -s node)
        and set -gx NODE_VER (string match -r 'v\d+\.\d+\.\d+' (path resolve $bin))
        and return
    end
    set -e NODE_VER
end
__node_ver
