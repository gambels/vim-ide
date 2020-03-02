" =============================================================================
" File: .vimrc
" Description: Main vim run command script
" =============================================================================

" No vi-compatible
set nocompatible

" =============================================================================
" Section: Configure vimrc
" =============================================================================
let vimrc_misc    = 1
let vimrc_keymap  = 1
let vimrc_plugins = 1

" =============================================================================
" Section: Load vimrc
" =============================================================================
if 1 == vimrc_misc
  so ~/.vim/misc.vim
endif

if 1 == vimrc_keymap
  so ~/.vim/keymap.vim
endif

if 1 == vimrc_plugins
  so ~/.vim/plugins.vim
endif

