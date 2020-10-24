" File:        my-todo
" Description: mytodo.txt filetype detection
" Author:      Andrius Miasnikovas <andriusms@gmail.com>
" License:     Vim license
" Website:     http://github.com/andriusm/my-todo
" Version:     0.1

autocmd BufNewFile,BufRead [Mm]ytodo.txt set filetype=mytodo
autocmd BufNewFile,BufRead home-todo.txt set filetype=mytodo
autocmd BufNewFile,BufRead personal-todo.txt set filetype=mytodo

function! TodoToggle()
  let pos = getpos(".")
  let c = getline('.')[0:1] 
  if c == '- '
      normal! ^r+ 
  elseif c == '+ '
      normal! ^r- 
  endif
  let pos[2] = pos[2] - 1
  call setpos('.', pos)
endfunction

nnoremap <silent> <F2> :call TodoToggle()<cr> 
