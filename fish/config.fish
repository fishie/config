if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
  bind \cd beginning-of-line kill-line
end
