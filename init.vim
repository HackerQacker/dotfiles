" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let mapleader = " "
"filetype plugin on
set number relativenumber

set tabstop=4
set shiftwidth=4
set smarttab

"""""""""" vim-tmux-navigator customizations
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nmap <silent> <M-Left> :TmuxNavigateLeft<CR>
nmap <silent> <M-Right> :TmuxNavigateRight<CR>
nmap <silent> <M-Up> :TmuxNavigateUp<CR>
nmap <silent> <M-Down> :TmuxNavigateDown<CR>
"nmap <silent> <M-/> :TmuxNavigatePrevious<cr>

let g:deoplete#enable_at_startup = 1

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

"""""""""" coc customizations

" Give more space for displaying messages.
" set cmdheight=2
" Use <M-space> to trigger completion.
inoremap <silent><expr> <M-space> coc#refresh()
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Symbol renaming.
nmap <F6> <Plug>(coc-rename)
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

