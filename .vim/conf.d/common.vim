" Settings that are not easily grouped in other categories or is
" common/default for all my enviroments. Sourced first, then later perhaps
" overwritten.
" " Look and feel
syntax on
"set t_Co=256 "we use 256 colors
"set background=dark
"colorscheme desertmodified
"colorscheme darkblue
"color vibrantink
"color candycode
"color jellybeans
set background=dark    " Light theme is used by default
set t_Co=256
"colorscheme PaperColor
colorscheme gruvbox
filetype plugin on " We want vim to load settings based on filetypes
filetype plugin indent on " pyflakes requirement #TODO: what is this?
" Hilight bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /\s\+$/
set cursorline " hilight the active line, must-have, but not good for slow systems #TODO: disable when on low-end systems
set ruler " display position of cursor in status bar
set showmatch " show matching brackets of code
set more " more/less behavior when messages span over the buffer length
set wrap " Long lines will wrap and display on next line
" We dont need this with powerline
hi statusline ctermfg=white ctermbg=blue cterm=NONE
hi Normal guibg=NONE ctermbg=NONE
"hi statuslineNC ctermfg=black ctermbg=grey cterm=NONE
" if not running CLI, reduce UI elements #TODO: test
"if has("gui_running")
" set guioptions+=mT<CR>
" set guioptions-=mT<CR>
"endif
"
" TODO: Read up on the next 5 options for fine tuning
set showcmd " vis kommando i status
set laststatus=2 " vis statuslinje alltid
set wildmode=longest:full " wildmenu ompletions as bash, not dos
set wildmenu " kommando completion blir bedre
set ch=1    " commandline height
"set spell
set nobackup " We don't want vim making a lot of backups, use git/svn instead
set clipboard=unnamed " use OSX clipboard #TODO: only set if on osx
set incsearch " Move cursor while searching
set hlsearch " hilight searchterms while searching
set ignorecase " Ignore case when searching ..
set smartcase " .. Unless we provide case
set autoread " watch for file changes #TODO: needs more oomph
" Disabling this for the a while, getting used to motions
set backspace=indent,eol,start " Backspace erases indentations, end of lines and start of lines 

" " Tabbing and indenting
set tabstop=8
set softtabstop=4
set shiftwidth=4
set smarttab " correct indent on tabs
set smartindent
set autoindent " Copy indenting from the line before
set expandtab " Spaces instead of tabs
set textwidth=80 " Haters gonna hate
set directory=~/ " swp files can stay in home directory
