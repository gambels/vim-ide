" =============================================================================
" File:  functions.vim
" Description: Function and command definition
" =============================================================================

" Delete trailing white spaces
function! TrimWhiteSpace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

" Toggle window zoom
function! WindowZoomToggle()
  if !exists('t:win_is_zoom')
    let t:win_is_zoom = 0
  endif

  if t:win_is_zoom
    wincmd =
    let t:win_is_zoom = 0
  else
    wincmd _
    let t:win_is_zoom = 1
  endif
endfunction

" Toggle help window
function! HelpToggle()
  if !exists('t:help_is_open')
    let t:help_is_open = 0
  endif

  if t:help_is_open
    helpclose
    let t:help_is_open = 0
  else
    help | wincmd _
    let t:help_is_open = 1
  endif
endfunction

" Toggle quickfix window
function! QuickFixToggle()
  if !exists('t:quickfix_is_open')
    let t:quickfix_is_open = 0
  endif

  if t:quickfix_is_open
      cclose
      let t:quickfix_is_open = 0
  else
      copen
      let t:quickfix_is_open = 1
  endif
endfunction

" =============================================================================
" Section: Configure commands
" =============================================================================

" Toggle commands
command HelpToggle call HelpToggle()
command QuickFixToggle call QuickFixToggle()

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
command! W w !sudo tee "%" > /dev/null

" =============================================================================
" Section: Configure auto commands
" =============================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd BufWritePre     * :call TrimWhiteSpace()
  "autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.md,*.cpp,*.h,*.hpp,*.c,*.mk,*.vim :call TrimWhiteSpace()

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

