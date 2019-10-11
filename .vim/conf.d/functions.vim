" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" This one is inspired from the link below and offers easy completion
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
" function! Auto_complete_string()
"     if pumvisible()
"         return "\<C-n>"
"     else
"         return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
"     end
" endfunction
" 
" function! Auto_complete_opened()
"     if pumvisible()
"         return "\<Down>"
"     end
"     return ""
" endfunction
" 
" inoremap <expr> <Nul> Auto_complete_string()
" inoremap <expr> <C-Space> Auto_complete_string()
