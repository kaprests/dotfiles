syntax on
set number " show line number "
set ignorecase " case insensitive search "
set pastetoggle=<f10>
set tabstop=4 " tabs as 4 spaces "
set shiftwidth=4
set expandtab
set hlsearch " highlight search matches "
set wildmenu " command suggestion upon tab "

call plug#begin()
    Plug 'lervag/vimtex'
        let g:tex_flavor = "latex"
        let g:tex_fast = "cmMprs"
        let g:tex_conceal = ""
        let g:tex_fold_enabled = 0
        let g:tex_nospell = 1
call plug#end()
