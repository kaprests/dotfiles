syntax on
set number " show line number "
set ignorecase " case insensitive search "
set pastetoggle=<f10>
set tabstop=4 " tabs as 4 spaces "
set shiftwidth=4
set expandtab
set hlsearch " highlight search matches "
set wildmenu " command suggestion upon tab "
set autoindent
set smartindent
set nocindent


" Plugins List
call plug#begin(stdpath('data') . '/plugged')
    Plug 'sirver/ultisnips'
        let g:UltiSnipsEditSplit="vertical"
        let g:UltiSnipsExpandTrigger = '<tab>'
        let g:UltiSnipsJumpForwardTrigger = '<c-j>'
        let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
        " let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
        " In case of python E319: No "python3" provider found.:
        " run:  python3 -m pip install --user --upgrade pynvim

    Plug 'honza/vim-snippets'

"    Plug 'lervag/vimtex'
"        let g:tex_flavor='latex'
"        let g:vimtex_view_method='zathura'
"        let g:vimtex_quickfix_mode=0
""        autocmd filetype tex highlight MatchParen ctermbg=8

    Plug 'KeitaNakamura/tex-conceal.vim'
        set conceallevel=1
        let g:tex_conceal='abdmg'
        hi Conceal ctermbg=none

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
        let g:deoplete#enable_at_startup = 1

"    setlocal spell
"    set spelllang=en_us
"    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
call plug#end()
