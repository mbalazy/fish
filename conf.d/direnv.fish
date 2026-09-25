set -gx DIRENV_LOG_FORMAT ""

# Lazy direnv: `direnv hook fish` + `direnv export fish` cost ~75ms per shell
# start, even when no .envrc is anywhere near. Install the real hook only
# once we enter a directory that has a .envrc up its tree; from then on the
# stock hook handles loading and unloading on its own.
function __direnv_lazy_hook --on-variable PWD
    set -l dir $PWD
    while true
        if test -e $dir/.envrc
            functions -e __direnv_lazy_hook
            direnv hook fish | source
            __direnv_export_eval
            return
        end
        test "$dir" = / ; and return
        set dir (path dirname $dir)
    end
end

if status is-interactive
    __direnv_lazy_hook
end
