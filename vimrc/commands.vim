" =============================================================================
" File: commands.vim
" Description: Command definition
" =============================================================================

" Define toggle commands
command HelpToggle call HelpToggle()
command QuickFixToggle call QuickFixToggle()

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
"command! W w !sudo tee "%" > /dev/null
