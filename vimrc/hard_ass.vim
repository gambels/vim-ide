
" File: hard_ass.vim
" Descritpion: source this, to use vim the hard way
" =============================================================================

" =============================================================================
" Section: Disable arrow keys for navigation
" =============================================================================
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor
