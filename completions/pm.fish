# Completions for pm (project manager CLI)

# Disable file completions by default
complete -c pm -f

# Helper: list project slugs
function __pm_projects
    for dir in ~/.claude/pm/*/
        if test -f "$dir/project.yaml"
            basename $dir
        end
    end
end

# Helper: list task IDs for a project
function __pm_task_ids
    set -l proj $argv[1]
    if test -d ~/.claude/pm/$proj
        for f in ~/.claude/pm/$proj/*.md
            basename $f .md | string replace -r '-.*' ''
        end
    end
end

# Helper: check if we're past subcommand (position >= N)
function __pm_needs_subcommand
    set -l cmd (commandline -opc)
    test (count $cmd) -eq 1
end

function __pm_using_subcommand
    set -l cmd (commandline -opc)
    test (count $cmd) -ge 2; and test "$cmd[2]" = "$argv[1]"
end

function __pm_needs_project
    set -l cmd (commandline -opc)
    test (count $cmd) -eq 2
end

function __pm_needs_task
    set -l cmd (commandline -opc)
    test (count $cmd) -eq 3
end

# Top-level subcommands
complete -c pm -n __pm_needs_subcommand -a board -d "Interactive kanban board"
complete -c pm -n __pm_needs_subcommand -a list -d "List tasks"
complete -c pm -n __pm_needs_subcommand -a add -d "Add a new task"
complete -c pm -n __pm_needs_subcommand -a show -d "Show task details"
complete -c pm -n __pm_needs_subcommand -a edit -d "Edit task in \$EDITOR"
complete -c pm -n __pm_needs_subcommand -a mv -d "Move task to status"
complete -c pm -n __pm_needs_subcommand -a done -d "Mark task as done"
complete -c pm -n __pm_needs_subcommand -a projects -d "List/manage projects"
complete -c pm -n __pm_needs_subcommand -a init -d "Initialize pm storage"

# Project argument for: board, add, show, edit, mv, done
for sub in board add show edit mv done
    complete -c pm -n "__pm_using_subcommand $sub; and __pm_needs_project" -a "(__pm_projects)"
end

# Task ID argument for: show, edit, mv, done
for sub in show edit mv done
    complete -c pm -n "__pm_using_subcommand $sub; and __pm_needs_task" -a "(__pm_task_ids (commandline -opc)[3])"
end

# Status argument for mv (4th position)
complete -c pm -n '__pm_using_subcommand mv; and test (count (commandline -opc)) -eq 4' -a "todo doing done"

# projects subcommands
complete -c pm -n '__pm_using_subcommand projects; and __pm_needs_project' -a add -d "Add a new project"

# list flags
complete -c pm -n '__pm_using_subcommand list' -s p -l project -d "Filter by project" -xa "(__pm_projects)"
complete -c pm -n '__pm_using_subcommand list' -s s -l status -d "Filter by status" -xa "todo doing done"

# add flags
complete -c pm -n '__pm_using_subcommand add' -l status -d "Task status" -xa "todo doing done"
complete -c pm -n '__pm_using_subcommand add' -l id -d "Task ID"
complete -c pm -n '__pm_using_subcommand add' -l link-azure -d "Azure DevOps link"
complete -c pm -n '__pm_using_subcommand add' -l link-jira -d "Jira link"
complete -c pm -n '__pm_using_subcommand add' -l link-figma -d "Figma link"
complete -c pm -n '__pm_using_subcommand add' -l branch -d "Git branch"
complete -c pm -n '__pm_using_subcommand add' -l tag -d "Tag"

# projects add flags
complete -c pm -n '__pm_using_subcommand projects' -l path -d "Local repo path" -rF
complete -c pm -n '__pm_using_subcommand projects' -l repo -d "Remote repo URL"
complete -c pm -n '__pm_using_subcommand projects' -l name -d "Display name"
complete -c pm -n '__pm_using_subcommand projects' -l tag -d "Tag"
