
#######################################
#      Azo's Sorta tiny scripts       #
#######################################

function paco() {
# Get the list of orphaned packages
orphaned_packages=$(pacman -Qdtq)
random_number=$((RANDOM % 10 + 1))

# Check if there are any orphaned packages
if [ -z "$orphaned_packages" ]; then
    echo "No oprhans found"
else
    # First pass: Remove orphaned packages (with user confirmation)
    echo "The following orphaned packages will be removed:"
    echo "$orphaned_packages"
    echo "Do you want to proceed? [y/N]"
    read -r user_input

    if [[ "$user_input" =~ ^[Yy]$ || -z "$user_input" ]]; then
        # User confirmed, proceed with the first pass
        sudo pacman -Rs $(pacman -Qtdq)

        # Check if the first pass was successful
        if [ $? -eq 0 ]; then
            # Second pass: Remove any remaining orphaned packages (non-interactive)
            remaining_orphaned_packages=$(pacman -Qdtq)
            echo remaining_orphaned_packages
            if [ -n "$remaining_orphaned_packages" ]; then
                echo "Running second pass to purge remaining orphans..."
                sudo pacman -Rs --noconfirm $(pacman -Qtdq)
            fi
        fi

        echo "Oprhans purged!"
         if [ "$random_number" -eq 1 ]; then
      echo "you monster"
    fi
    else
        # User declined, exit without doing anything
        echo "Operation canceled."
    fi
fi
}

alias c='clear'

alias e='exit'

alias ff='fastfetch'

alias k='pkill konsole'

#cd into downloads and run yt-dlp

function ytd() {
  cd ~/Downloads/ || return

  echo "\e[36mDownloading video to "~/Downloads"\e[0m"

  yt-dlp "$1"

  cd
}


