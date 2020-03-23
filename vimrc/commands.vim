" =============================================================================
" File: commands.vim
" Description: Command definition
" =============================================================================

" Define minpac user commands
command! PackUpdate  call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean   call PackInit() | call minpac#clean()
command! PackStatus  call PackInit() | call minpac#status()
command! PackInstall call PackInit() | call minpac#update('', {'do': 'quit'})

" Define toggle commands
command HelpToggle call HelpToggle()
command QuickFixToggle call QuickFixToggle()

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
"command! W w !sudo tee "%" > /dev/null
