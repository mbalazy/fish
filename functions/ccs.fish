# ccs - launch Claude Code for a solo run (unattended): bypass permissions,
# 400k auto-compact window, and - when the repo's shared .claude/settings.json
# carries `ask` rules (they prompt in EVERY mode, bypass included) - project
# settings skipped with --setting-sources user,local, so nothing asks at night.
# The shared deny list must then be mirrored in .claude/settings.local.json;
# the solo skill's launch-check.sh verifies that at Step 0.
# usage: ccs [extra claude args]      CCS_DRY=1 ccs -> print the command only
function ccs --description 'claude for solo runs: bypass + 400k window + ask-rule-safe'
    set -l cmd claude --dangerously-skip-permissions --autocompact 400k
    set -l root (git rev-parse --show-toplevel 2>/dev/null); or set root $PWD
    set -l shared $root/.claude/settings.json
    if test -f $shared
        set -l n (python3 -c 'import json,sys
try: print(len(json.load(open(sys.argv[1])).get("permissions",{}).get("ask",[])))
except Exception: print(0)' $shared 2>/dev/null)
        if test "$n" -gt 0
            set -a cmd --setting-sources user,local
            echo "ccs: $shared has $n ask rule(s) -> --setting-sources user,local (project settings skipped)" >&2
            if not test -f $root/.claude/settings.local.json
                echo "ccs: WARNING no .claude/settings.local.json - the shared deny list is NOT in effect; mirror it first" >&2
            end
        end
    end
    if set -q CCS_DRY
        echo $cmd $argv
        return 0
    end
    $cmd $argv
end
