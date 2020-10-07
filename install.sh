#!/bin/bash
set -u


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
echo "Installing vim-ide from $DIR"

VIMRC=$(cat << EOF
" =============================================================================
" File: .vimrc
" Description: Main vim run command script
" =============================================================================

" Using $DIR to find packages
set packpath^=$DIR

" Using $DIR as home "after" directory
set runtimepath+=$DIR/after

" No vi-compatible
set nocompatible

" =============================================================================
" Section: Configure vimrc
" =============================================================================

" Using $DIR to find vimrc files
let \$MYVIMRCPATH = "$DIR/vimrc"

let vimrc_misc      = 1
let vimrc_keymap    = 1
let vimrc_hard_ass  = 1
let vimrc_functions = 1
let vimrc_commands  = 1
let vimrc_filetypes = 1
let vimrc_plugins   = 1

" =============================================================================
" Section: Load vimrc
" =============================================================================

if 1 == vimrc_misc
  so $DIR/vimrc/misc.vim
endif

if 1 == vimrc_keymap
  so $DIR/vimrc/keymap.vim
endif

if 1 == vimrc_hard_ass
  so $DIR/vimrc/hard_ass.vim
endif

if 1 == vimrc_functions
  so $DIR/vimrc/functions.vim
endif

if 1 == vimrc_commands
  so $DIR/vimrc/commands.vim
endif

if 1 == vimrc_filetypes
  so $DIR/vimrc/filetypes.vim
endif

if 1 == vimrc_plugins
  so $DIR/vimrc/plugins.vim
endif

EOF
)

if [ $# -eq 0 ]; then
  USERS=$(id -un)
elif [ "$1" == "--all" ]; then
  USERS=$(getent passwd | grep /home | cut -d: -f1 | tr '\n' ' ')
else
  USERS=${@:1}
fi

echo "Selected users: $USERS"
for USER in $USERS; do
  user_home=$(eval echo "~$USER")
  user_vimrc="${user_home}/.vimrc"

  echo "$VIMRC" > "$user_vimrc" && chown "$USER"."$USER" "$user_vimrc" || exit 1
  echo "Installed the vim-ide configuration for user '$USER' successfully! Enjoy :-)"
done

echo "Update plugins .."
vim -N -u "$DIR"/vimrc/plugins.vim -c "set packpath^=$DIR" -c "PackInstall"
if [ $? -ne 0 ]; then
  echo "PackInstall failed. Minpack installed? (see README.md)"
  exit 1
fi
echo "Update helptags .."
vim -N -u "$DIR"/vimrc/plugins.vim -c "silent! helptags ALL" -c "quitall!"

exit 0


### EOF ###

