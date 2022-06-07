syntax on
filetype plugin indent on
set number " show line number "
set ignorecase " case insensitive search "
set pastetoggle=<f10>
set hlsearch " highlight search matches "
set wildmenu " command suggestion upon tab "
set autoindent
set smartindent
set nocindent
nnoremap <NL> i<CR><ESC>

set tabstop=4 " tabs as 4 spaces "
set shiftwidth=4
set expandtab

autocmd BufNewFile,BufRead *.tex set spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

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

    Plug 'lervag/vimtex'
        let g:tex_flavor='latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0
        let g:vimtex_view_forward_search_on_start = 1
        autocmd filetype tex highlight MatchParen ctermbg=8

    Plug 'KeitaNakamura/tex-conceal.vim'
        set conceallevel=1
        let g:tex_conceal='abdmg'
        hi Conceal ctermbg=none

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"    Plug 'ludovicchabant/vim-gutentags'

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
        let g:deoplete#enable_at_startup = 1
call plug#end()
