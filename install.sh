#!/bin/bash
set -e


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Installing vim-ide from $DIR"

VIMRC="
\" =============================================================================
\" File: .vimrc
\" Description: Main vim run command script
\" =============================================================================

\" Using $DIR instead of vimfiles
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

if [ $# -eq 0 ]; then
    IFS = ''
    echo $VIMRC > ~/.vimrc
    unset IFS
elif [ $1 == "--all" ]; then
    USERS=($(ls -l /home | awk '{if(NR>1)print $9}'))
    for user in ${USERS[*]}; do
        homepath=$(eval echo "~$user")
        IFS=''
        echo $VIMRC > ${homepath}/.vimrc
        unset IFS
        echo "Installed vim-ide configuration for user $user successfully! Enjoy :-)"
    done
    echo "Installed vim-ide configuration successfully! Enjoy :-)"
    exit 0
else
    SELECTED_USERS=(${@:1})
    echo "Selected users: ${SELECTED_USERS[@]}"
    for user in ${SELECTED_USERS[@]}; do
        homepath=$(eval echo "~$user")
        IFS=''
        echo $VIMRC > ${homepath}/.vimrc
        unset IFS
        echo "Installed the vim-ide configuration for user $user successfully! Enjoy :-)"
    done
    exit 0
fi

