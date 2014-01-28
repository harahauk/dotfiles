" Settings that are not easily grouped in other categories or is
" common/default for all my enviroments. Sourced first, then later perhaps
" overwritten.
syntax on
set background=dark
color jellybeans
filetype plugin on " We want vim to load settings based on filetypes
filetype plugin indent on " pyflakes requirement #TODO: what is this?
set clipboard=unnamed " use OSX clipboard #TODO: only set if on osx
"" if not running CLI, reduce UI elements #TODO: test
"if has("gui_running")
" set guioptions+=mT<CR>
" set guioptions-=mT<CR>
"endif
set cursorline " hilight the active line, must-have


