" =============================================================================
" File: functions.vim
" Description: Function definition
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

