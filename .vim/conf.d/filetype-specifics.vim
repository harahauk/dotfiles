" Creole (a markdown language)
au BufNewFile,BufRead *.creole set syntax=creole
au BufNewFile,BufRead *.creole set spelllang=no
au BufNewFile,BufRead *.creole set spell
au FileType objc map P :ListMethods<CR>
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

