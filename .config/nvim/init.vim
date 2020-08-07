
call plug#begin()
Plug 'ncm2/ncm2'

Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'joshdick/onedark.vim'
Plug 'flrnprz/candid.vim'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'liuchengxu/space-vim-theme'
Plug 'tpope/vim-surround'
"Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/nerdTree'

Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'Konfekt/FastFold'
Plug 'matze/vim-tex-fold'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"OCaml

Plug 'vim-syntastic/syntastic'
Plug 'ocaml/merlin'
Plug 'jpalardy/vim-slime'
Plug 'OCamlPro/ocp-indent'

Plug 'rust-lang/rust.vim'
Plug 'alaviss/nim.nvim'

Plug 'optimizacija/neovim-config'
Plug 'JuliaEditorSupport/julia-vim'

Plug 'connorholyday/vim-snazzy'
call plug#end()


autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

let g:python3_host_prog='/usr/bin/python3'

syntax on 

colorscheme space_vim_theme 
"colorscheme snazzy
function! s:goyo_enter()
    colorscheme pencil
endfunction

function! s:goyo_leave()
    colorscheme candid
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


set number relativenumber
set nu rnu

set hlsearch 

set ignorecase
set smartcase

set autoindent

set showmatch 


autocmd FileType gitcommit setlocal spell spelllang=en_gb
autocmd FileType md setlocal spell spelllang=en_gb
autocmd FileType gitcommit setlocal spell spelllang=en_gb

" autocomplpetetion key rebindings

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"


"let g:tex_flavor  = 'latex'
"let g:tex_conceal = ''
"let g:vimtex_fold_manual = 1
"let g:vimtex_latexmk_continuous = 1
"let g:vimtex_compiler_progname = 'nvr'
"
"let g:vim_markdown_math = 1
"let g:vim_markdown_strikethrough = 1
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


"augroup NCM2
"  autocmd!
"  " some other settings...
"  " uncomment this block if you use vimtex for LaTex
"  autocmd Filetype tex call ncm2#register_source({
"            \ 'name': 'vimtex',
"            \ 'priority': 8,
"            \ 'scope': ['tex','md'],
"            \ 'mark': 'tex',
"            \ 'word_pattern': '\w+',
"            \ 'complete_pattern': g:vimtex#re#ncm2,
"            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"            \ })
"augroup END

"let g:vimtex_view_method ='zathura'
"let g:xwindow_id = system('xdotool getactivewindow')
"let g:vimtex_view_zathura_hook_view = 'MyHook'
"let g:vimtex_view_zathura_hook_callback = 'MyHook'
"
"function! MyHook()
"  silent call system('xdotool windowactivate ' . g:xwindow_id . ' --sync')
"endfunction

map B ^
map E $ 

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
