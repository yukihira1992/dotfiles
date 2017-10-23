if did_filetype()
  finish
endif

autocmd BufRead,BufNewFile * :if getline(1) =~ '^.*startuml.*$'| setfiletype plantuml | set filetype=plantuml | endif
autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml setfiletype plantuml | set filetype=plantuml
fun! s:DetectGraphviz()
    if getline(1) == 'digraph'
        set filetype=dot
    endif
endfun

au BufRead,BufNewFile *.gv,*.dot set filetype=dot
au BufRead,BufNewFile * call s:DetectGraphviz()

