if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
  bind \cd beginning-of-line kill-line
end

function search
  echo -e "\033[1;33myay\033[0m" &&
  unbuffer yay --singlelineresults --topdown -Ss $argv | head -n -2 | head -n 5 &&
  echo -e "\n\033[1;33msnap\033[0m" &&
  unbuffer snap find $argv | head -n 5 &&
  echo -e "\n\033[1;33mflatpak\033[0m" &&
  unbuffer flatpak search --columns=name,version,description $argv | head -n 5
end
