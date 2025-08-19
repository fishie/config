if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Smart Enter: run 'ls' when pressing Enter on empty prompt
function do_enter
    set cmd (commandline)
    if test -z "$cmd"
        commandline -r 'ls'
        commandline -f execute
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
