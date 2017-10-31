" Creole (a markdown language)
au BufNewFile,BufRead *.creole set syntax=creole
au BufNewFile,BufRead *.creole set spelllang=no
au BufNewFile,BufRead *.creole set spell
au FileType objc map P :ListMethods<CR>
" Don't mind ridicilous lengths of snort rules
au FileType hog set tw=0
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
let python_highlight_all=1

