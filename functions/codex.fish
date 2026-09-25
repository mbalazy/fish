function codex --description 'Codex: Little Engine account in LE projects, personal elsewhere'
    # Keep the original arguments intact while inspecting the working directory.
    set -l codex_args $argv
    argparse --name=codex --ignore-unknown 'C/cd=' -- $argv
    or return $status

    set -l target_dir $PWD
    if set -q _flag_cd
        set target_dir $_flag_cd
    end

    set target_dir (path resolve -- "$target_dir")
    or return $status
    set -l le_root (path resolve -- "$HOME/repos/littleEngine")
    or return $status

    if test "$target_dir" = "$le_root"; or string match --quiet -- "$le_root/*" "$target_dir"
        codex-le $codex_args
    else
        codexp $codex_args
    end
end
