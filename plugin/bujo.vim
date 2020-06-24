"Make bujo directory if it doesn't exist"
if empty(glob('~/bujo'))
  call mkdir($HOME . '/bujo', 'p')
endif
autocmd bufnewfile todo.md call append(0, '  __________  ____  ____\n/_  __/ __ \/ __ \/ __ \\n  / / / / / / / / / / / /\n  / / / /_/ / /_/ / /_/ /\n /_/  \____/_____/\____/')
autocmd bufnewfile todo.md call append(7, 'Date: ')
autocmd bufnewfile,bufreadpre todo.md exe "g/Date: */s/Date: /Date: " .strftime("%a %d %b %Y")
autocmd bufnewfile,Bufwritepre,filewritepre todo.md execute "normal G"



" Open the bujo todo list file
function s:OpenTodo()
  "30 makes it open at width 30
  exe ":30vs ~/bujo/todo.md" 
endfunction

if !exists(":Todo")
  command Todo :call s:OpenTodo()
endif
