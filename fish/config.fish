if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Smart Enter: run 'ls' when pressing Enter on empty prompt
function do_enter
    if test -z "$(commandline)"
        echo
        ls
        commandline -f repaint
    else
        commandline -f execute
    end
end
bind \r do_enter

# Bind Escape to clear line, similar to how PowerShell handles Escape
function smart_escape
    if commandline --paging-mode
        commandline --function cancel
    else
        commandline ""
    end
end
bind \e smart_escape

# On empty prompt, tab only lists folders
function tab_or_cd_complete
    if test -z (commandline)
        commandline -i 'cd '
        commandline -f complete
    else
        commandline -f complete
    end
end

bind \t tab_or_cd_complete
