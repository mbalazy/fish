# rbenv, lazy: `rbenv init` costs ~48ms, so it runs on the first ruby-ish
# command only. The wrappers are erased first so `command X` hits the shim.
function __rbenv_load
    functions -e rbenv ruby gem bundle pod
    command rbenv init - fish | source
end

for cmd in rbenv ruby gem bundle pod
    function $cmd --inherit-variable cmd
        __rbenv_load
        command $cmd $argv
    end
end
