" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
" Some coc extensions below
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TODO: remove it when coc has a builtin call hierarchy
Plug 'm-pilia/vim-ccls', {'do': 'yarn install --frozen-lockfile'}
Plug 'm-pilia/vim-yggdrasil', {'do': 'yarn install --frozen-lockfile'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let mapleader = " "
" filetype plugin on
set number relativenumber

"""""""""" Tabs handling
set tabstop=4
set shiftwidth=4
set smarttab
command RetabFile execute "normal! gg=G<C-o><C-o>"

"""""""""" Copy and paste to system clipboard
set clipboard+=unnamedplus

" For not having some delays
" Have to remember' if it will be laggy, that's maybe gonna be the case..
set updatetime=300

" Not gonna use the mouse anyway, but it better set so if someone else will
" use my computer
set mouse=a

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Nicer commenting for c (based)
autocmd FileType c,cpp setlocal commentstring=//\ %s

"""""""""" Ah! vim's default splitting side is just annoying
set splitbelow
set splitright

"""""""""" Easy save
nmap <C-s> :w<CR>
nmap <leader>s :w<CR>

"""""""""" Easy quit
nmap <leader>q :q<CR>

"""""""""" It just make me crazy
" set nobackup
" set nowritebackup

"""""""""" So annoying to switch to normal mode within a terminal window...
" tmap <Esc> <C-\><C-n>

"""""""""" vim-tmux-navigator customizations
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-Left> :TmuxNavigateLeft<CR>
inoremap <silent> <M-Left> <ESC>:TmuxNavigateLeft<CR>
tnoremap <silent> <M-Left> <C-\><C-n>:TmuxNavigateLeft<CR>
nnoremap <silent> <M-Right> :TmuxNavigateRight<CR>
inoremap <silent> <M-Right> <ESC>:TmuxNavigateRight<CR>
tnoremap <silent> <M-Right> <C-\><C-n>:TmuxNavigateRight<CR>
nnoremap <silent> <M-Up> :TmuxNavigateUp<CR>
inoremap <silent> <M-Up> <ESC>:TmuxNavigateUp<CR>
tnoremap <silent> <M-Up> <C-\><C-n>:TmuxNavigateUp<CR>
nnoremap <silent> <M-Down> :TmuxNavigateDown<CR>
inoremap <silent> <M-Down> <ESC>:TmuxNavigateDown<CR>
tnoremap <silent> <M-Down> <C-\><C-n>:TmuxNavigateDown<CR>
"nnoremap <silent> <M-/> :TmuxNavigatePrevious<cr>

"""""""""" Markdown settings
" used to open the preview in a kind of popup window (instead of just using
" the default browser)
function! g:Open_mac_chrome_in_new_popup(url)
    silent exe 'silent !open -na "Google Chrome" --args --app=' . a:url
endfunction

" TODO: could easily be implemented to all unix platforms, at the moment I
" only use markdown preview on my mac
if has('mac')
	let g:mkdp_browserfunc='g:Open_mac_chrome_in_new_popup'
endif

"""""""""" vim-go customizations
let g:go_gopls_enabled = 0
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
" let g:go_def_mapping_enabled = 0
" better gopls integration?
" let g:go_info_mode='gopls'
" let g:go_rename_command = 'gopls'
" a bit nicer better highlighting
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
" let g:go_highlight_function_parameters = 1

"""""""""" coc
"""""""""" coc extensions
let g:coc_global_extensions = [
			\'coc-python',
			\'coc-rls',
			\'coc-yaml',
			\'coc-json',
			\'coc-snippets',
			\'coc-highlight',
			\'coc-go',
			\'coc-sourcekit',
			\'coc-clangd',
			\'coc-tsserver',
			\'coc-cmake',
			\'coc-java',
			\'coc-sh'
			\]
"""""""""" coc customizations
" Give more space for displaying messages.
" set cmdheight=2
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
" Use <M-space> to trigger completion.
inoremap <silent><expr> <M-space> coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

"""""""""" Python customizations
command Pyterm :CocCommand 'python.startREPL'

""""""""""

"""""""""" vim-ccls customizations
" Automatically close a tree buffer when jumping to a location
let g:ccls_close_on_jump = v:true
let g:yggdrasil_no_default_maps = 1

""""""""""

"""""""""" FZF customizations
nnoremap <leader><leader> :Rg<SPACE>
" nnoremap <leader>f :FZF<CR>
nnoremap <leader>f :Files<CR>
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"""""""""" Custom command for inserting my own type of comment
let g:my_comment_prefix = '@O.Y: '
function! MYCommentNewlineFunc()
	let pos = getpos('.')
	let indent_needed = indent(pos[1])
	call append(pos[1], split(&commentstring, '%s')[0].g:my_comment_prefix)
	call setpos('.', [pos[0], pos[1]+1, pos[2], pos[3]])
	normal! ==
	normal! g$
endfunction
command MYCommentNewline call MYCommentNewlineFunc()
nmap <leader>co :MYCommentNewline<CR>

command MYComment execute 'normal!' 'I'.split(&commentstring, '%s')[0].g:my_comment_prefix
nmap <leader>cc :MYComment<CR>
vmap <leader>cc :MYComment<CR>

""""""""""" Debugger integration shit
let g:termdebug_wide=1

"""""""""" Add statusline support.
" TODO: Add a simple color support
set statusline=
set statusline+=%0*%m%r%w
" set statusline+=%0*\ %<%F
set statusline+=%0*\ %<%f
set statusline+=%0*\ %y
set statusline+=%0*\ %=
set statusline+=%0*\ %{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%0*\ [%l:%L]

""""""""""" colors
" I decided it's better to let the terminal (alacritty in my case) to handle
" colors. So colorschemes are not needed :)
