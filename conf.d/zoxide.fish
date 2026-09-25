# zoxide, lazy: the init runs on the first z / zi call.
function z --wraps zoxide
    functions -e z zi
    zoxide init fish | source
    z $argv
end

function zi --wraps zoxide
    functions -e z zi
    zoxide init fish | source
    zi $argv
end
