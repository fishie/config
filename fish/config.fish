if status is-interactive
    # Commands to run in interactive sessions can go here
end

function smart_escape
    if commandline --paging-mode
        commandline --function cancel
    else
        commandline ""
    end
end

bind \e smart_escape

function search
  echo -e "\033[1;33myay\033[0m" &&
  unbuffer yay --singlelineresults --topdown -Ss $argv | head -n -2 | head -n 5 &&
  echo -e "\n\033[1;33msnap\033[0m" &&
  unbuffer snap find $argv | head -n 5 &&
  echo -e "\n\033[1;33mflatpak\033[0m" &&
  unbuffer flatpak search --columns=name:f,version:f,description $argv | head -n 5
end
