" @author Harald Hauknes <harald@hauknes.org>
set nocompatible " be viMproved, required for a lot of plugins
" Load plugins before fiddling too much with settings
source ~/.vim/conf.d/plugins.vim
" Load settings that are good for all enviroments
source ~/.vim/conf.d/common.vim
" Autocmds/hooks when opening specific filetypes
source ~/.vim/conf.d/filetype-specifics.vim
" Load self-defined functions
source ~/.vim/conf.d/functions.vim
" Define snippets
source ~/.vim/conf.d/snippets.vim
"TODO: Make project specific
"let g:fugitive_gitlab_domains = ['']
