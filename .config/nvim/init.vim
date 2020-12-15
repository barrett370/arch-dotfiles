"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

"Completions
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'plasticboy/vim-markdown'
Plug 'joshdick/onedark.vim'

Plug 'ervandew/supertab'
Plug 'roxma/vim-paste-easy'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf' 
Plug 'dracula/vim', { 'name': 'dracula' }


Plug 'kristijanhusak/vim-carbon-now-sh'


"Plug 'JuliaEditorSupport/julia-vim'


Plug 'cespare/vim-toml'

call plug#end()


" switch between colour schemes


syntax enable
highlight link CocFloating markdown

set number relativenumber
set hlsearch
set ignorecase
set smartcase
set autoindent
set showmatch

"set soft tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"Escape terminal buffer
:tnoremap <Esc> <C-\><C-n>


let g:python3_host_prog = '/home/sam/.venv/neovim3/bin/python3'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_compiler='latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdflatex="pdflatex --shell-escape %O %S"',
    \   '--pdf'
    \ ],
    \}

autocmd FileType gitcommit setlocal spell spelllang=en_gb
autocmd FileType tex setlocal spell spelllang=en_gb
autocmd FileType md setlocal spell spelllang=en_gb

"coc default settings

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"
"
"
"
"sd
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Use <c-space> to trigger completion.
" 
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Window Splitting
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

nnoremap <silent> <A-L> :vertical resize +1<CR>
nnoremap <silent> <A-H> :vertical resize -1<CR>
nnoremap <silent> <A-J> :resize +1<CR>
nnoremap <silent> <A-K> :resize -1<CR>


" Buffer naviagion

nnoremap <silent> <A-l> :bn<CR>
nnoremap <silent> <A-h> :bp<CR>

" trigger fzf search
nnoremap <silent> <A-space> :FZF<CR>
nnoremap <silent> <leader><A-space> :FZF ~ <CR>

"open nerdtree
nnoremap <silent> <leader><tab> :NERDTree <CR>

" Airline config
"
let g:airline#extensions#tabline#enabled = 1
set conceallevel=2
let g:vim_markdown_math = 1 

" Ultisnips

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-tab>"



:let g:latex_to_unicode_auto = 1


let g:vimtex_fold_enabled =1
nnoremap <esc><esc> :silent! nohls<cr>


nnoremap <silent> <leader>tn :colorscheme default <CR>
nnoremap <silent> <leader>td :colorscheme dracula<CR>

let g:goyo_width = 95
nnoremap <silent> <leader>g :Goyo<CR>
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" cursor settings

""set guicursor=i-ci:hor30-iCursor-blinkon100,n:ver40
