#!/bin/bash

while true
    do
        read -e -n 1 -r -p "This may overwrite files in ($HOME/). Continue? [y/N] " RESP
        case $RESP in
        [yY])
            break
            ;;
        [nN]|"")
            echo -e "\033[91mInstallation aborted.\033[m"
            exit 1
             ;;
         *)
            echo -e "\033[91mPlease choose y or n\033[m"     
            ;;
        esac
done

rsync --exclude=".git/" --exclude "install.sh" --exclude="README.md" -avh --no-perms . ~;

source ~/.bashrc;

