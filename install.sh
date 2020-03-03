#!/bin/bash
set -e


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Installing vim-ide from $DIR"

VIMRC="
\" =============================================================================
\" File: .vimrc
\" Description: Main vim run command script
\" =============================================================================

set packpath^=$DIR

\" No vi-compatible
set nocompatible

\" =============================================================================
\" Section: Configure vimrc
\" =============================================================================
 let vimrc_misc    = 1
 let vimrc_keymap  = 1
 let vimrc_plugins = 1

\" =============================================================================
\" Section: Load vimrc
\" =============================================================================
 if 1 == vimrc_misc
   so $DIR/vimrcs/misc.vim
 endif

 if 1 == vimrc_keymap
   so $DIR/vimrcs/keymap.vim
 endif

 if 1 == vimrc_plugins
   so $DIR/vimrcs/plugins.vim
 endif
"

IFS=''
if [ $# -eq 0 ]; then
    echo $VIMRC > ~/.vimrc
elif [ $2 == "--all" ]; then
    USERS=($(ls -l /home | awk '{if(NR>1)print $9}'))
    for user in ${USERS[*]}; do
        homepath=$(eval echo "~$user")
        IFS=''
        echo $VIMRC > ${homepath}/.vimrc
        echo "Installed vim-ide configuration for user $user successfully! Enjoy :-)"
    done
    echo "Installed vim-ide configuration successfully! Enjoy :-)"
    exit 0
else
    SELECTED_USERS=(${@:2})
    echo "Selected users: ${SELECTED_USERS[@]}"
    for user in ${SELECTED_USERS[@]}; do
        homepath=$(eval echo "~$user")
        echo $VIMRC > ${homepath}/.vimrc
        echo "Installed the vim-ide configuration for user $user successfully! Enjoy :-)"
    done
    exit 0
fi

unset IFS
