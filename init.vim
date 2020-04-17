" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Some coc extensions
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'klaaspieter/coc-sourcekit', {'do': 'yarn install --frozen-lockfile'}


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let mapleader = " "
"filetype plugin on
set number relativenumber

set tabstop=4
set shiftwidth=4
set smarttab

"""""""""" Copy and paste to system clipboard
set clipboard+=unnamedplus

" For not having some delays
" Have to remember' if it will be laggy, that's maybe gonna be the case..
set updatetime=300

"""""""""" Easy save
nmap <C-s> :w<CR>

"""""""""" vim-tmux-navigator customizations
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-Right> :TmuxNavigateRight<CR>
nnoremap <silent> <M-Up> :TmuxNavigateUp<CR>
nnoremap <silent> <M-Down> :TmuxNavigateDown<CR>
"nmap <silent> <M-/> :TmuxNavigatePrevious<cr>

nmap <C-n> :NERDTreeToggle<CR>

"""""""""" Markdown settings
" used to open the preview in a kind of popup window (instead of just using
" the default browser)
function! g:Open_mac_chrome_in_new_popup(url)
    silent exe 'silent !open -na "Google Chrome" --args --app=' . a:url
endfunction

" TODO: could easily be implemented to all unix platforms, at the moment I
" only use markdown preview on my mac
let s:uname = system("uname -s")
if s:uname == "Darwin\n"
	let g:mkdp_browserfunc='g:Open_mac_chrome_in_new_popup'
endif

"""""""""" vim-go customizations
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

"""""""""" coc customizations
" Give more space for displaying messages.
" set cmdheight=2
" Use <M-space> to trigger completion.
inoremap <silent><expr> <M-space> coc#refresh()
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <F6> <Plug>(coc-rename)
nmap <leader>rn <Plug>(coc-rename)
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)


"""""""""" Custom command for inserting my own type of comment
command OYComment execute 'normal!' 'I'.split(&commentstring, '%s')[0].'@O.Y: '
nmap <leader>cc :OYComment<CR>
vmap <leader>cc :OYComment<CR>

""""""""""" colors
" I decided it's better to let the terminal (alacritty in my case) to handle
" colors. So colorschemes are not needed :)
