syntax on
set number " show line number "
set ignorecase " case insensitive search "
set pastetoggle=<f10>
set autoindent " keep current indentation on newline "
set tabstop=4 " tabs as 4 spaces "
set shiftwidth=4
set expandtab
set hlsearch " highlight search matches "
set wildmenu " command suggestion upon tab "

" Plugins List
call plug#begin(stdpath('data') . '/plugged')
    Plug 'lervag/vimtex'
call plug#end()
