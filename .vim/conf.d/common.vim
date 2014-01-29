" Settings that are not easily grouped in other categories or is
" common/default for all my enviroments. Sourced first, then later perhaps
" overwritten.
" " Look and feel
syntax on
"set background=dark
"colorscheme desertmodified
"colorscheme darkblue
"color vibrantink
"color candycode
color jellybeans
filetype plugin on " We want vim to load settings based on filetypes
filetype plugin indent on " pyflakes requirement #TODO: what is this?
"set ruler " shows position of cursor in the bottom #TODO: want?
set cursorline " hilight the active line, must-have, but not good for slow systems #TODO: disable when on low-end systems
set wrap " Long lines will wrap and display on next line
" if not running CLI, reduce UI elements #TODO: test
"if has("gui_running")
" set guioptions+=mT<CR>
" set guioptions-=mT<CR>
"endif
"
set clipboard=unnamed " use OSX clipboard #TODO: only set if on osx
set incsearch " Move cursor while searching
set hlsearch " hilight searchterms while searching
set ignorecase " Ignore case when searching ..
set smartcase " .. Unless we provide case
set autoread " watch for file changes #TODO: needs more oomph

