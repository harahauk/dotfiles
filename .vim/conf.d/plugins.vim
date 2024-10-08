filetype off " See vundledoc
set rtp+=~/.vim/bundle/vundle/ " Set runtimepath, #TODO: not sure if needed
call vundle#rc() " fire up vundle
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
"" My current colorscheme
"Bundle 'nanotech/jellybeans.vim'
"test-them Bundle 'sjl/vitality.vim'
"test-them " vim-scripts mirrors are not neccesarily last version
" Simple TODO buffer generator, reads FIXME etc and makes a list to navigate.
Bundle 'TaskList.vim'
map T :TaskList<CR>
"test-them Bundle 'indentLine.vim'
" Taglist uses exuberant ctags to create an IDE-like navigator through
" variables and functions
Bundle 'taglist.vim'
" Settings for taglist.vim
if filereadable('/usr/local/bin/ctags')
    let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' "exuberant ctags
else
    " Assume the cygwin version of ctags
    let Tlist_Ctags_Cmd = "/usr/bin/ctags"
endif
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
" Defines a hotkey that opens the navigator
"map P :TlistToggle<CR>
" Git integration
"Bundle 'tpope/vim-fugitive' " Does not seem to work anymore
"test-them Bundle 'majutsushi/tagbar'
"test-them Bundle 'msanders/cocoa.vim'
" FIXME: Plugins under testing
"Bundle 'shumphrey/fugitive-gitlab' "Apparently gone
Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { 'regex': 'bad-continuation' }
Plugin 'nvie/vim-flake8'
"test-them Bundle 'sjl/badwolf'
"test-them Bundle 'zaiste/Atom'
"test-them Bundle 'w0ng/vim-hybrid'
"test-them Bundle 'bigfish/vim-js-context-coloring'
"test-them "Bundle 'altercation/vim-colors-solarized'
"test-them "Bundle 'spf13/vim-colors' jellyban ftw really
"test-them Bundle 'Lokaltog/powerline'
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"call vam#ActivateAddons(['powerline'])
"test-them Bundle 'skammer/vim-css-color'
"test-them Bundle 'klen/python-mode'
" Java omnifunc complete, works pretty well
" Bundle 'javacomplete'
" autocmd Filetype java setlocal omnifunc=javacomplete#Complete
" Swift syntax hilighting
Bundle 'toyamarinyon/vim-swift'
Bundle 'elzr/vim-json'
" More lightweight completion than YCM
"Bundle 'ajh17/VimCompletesMe'
"Plugin 'NLKNguyen/papercolor-theme'
Plugin 'morhetz/gruvbox'
" Powershell
Bundle 'PProvost/vim-ps1'
call vundle#end() " required
" Another vundle requirement
filetype plugin indent on
filetype on
