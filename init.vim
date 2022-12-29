" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Plug 'mfussenegger/nvim-dap'
" Some coc extensions below
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'

" Plug 'hsanson/vim-android'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set hidden

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
" Have to remember: if it will be laggy, that's maybe gonna be the case..
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

"""""""""" Easy quit
nmap <leader>q :q<CR>

"""""""""" Insert/append a single character
nnoremap <leader>i :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <leader>a :exec "normal a".nr2char(getchar())."\e"<CR>

"""""""""" It just make me crazy
" set nobackup
" set nowritebackup

"""""""""" So annoying to switch to normal mode within a terminal window...
" tmap <Esc> <C-\><C-n>

"""""""""" vim-tmux-navigator customizations
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
inoremap <silent> <M-h> <ESC>:TmuxNavigateLeft<CR>
tnoremap <silent> <M-h> <C-\><C-n>:TmuxNavigateLeft<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
inoremap <silent> <M-l> <ESC>:TmuxNavigateRight<CR>
tnoremap <silent> <M-l> <C-\><C-n>:TmuxNavigateRight<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
inoremap <silent> <M-k> <ESC>:TmuxNavigateUp<CR>
tnoremap <silent> <M-k> <C-\><C-n>:TmuxNavigateUp<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
inoremap <silent> <M-j> <ESC>:TmuxNavigateDown<CR>
tnoremap <silent> <M-j> <C-\><C-n>:TmuxNavigateDown<CR>
"nnoremap <silent> <M-/> :TmuxNavigatePrevious<cr>

"""""""""" Markdown settings
" used to open the preview in a kind of popup window (instead of just using
" the default browser)
function! g:Open_mac_chrome_in_new_popup(url)
    silent exe 'silent !open -na "Google Chrome" --args --app=' . a:url
endfunction

function! g:Open_mac_chromium_in_new_popup(url)
    silent exe 'silent !open -na "Chromium" --args --app=' . a:url
endfunction

" TODO: could easily be implemented to all unix platforms, at the moment I
" only use markdown preview on my mac
if has('mac')
	let g:mkdp_browserfunc='g:Open_mac_chromium_in_new_popup'
endif

"""""""""" Vimspector extensions
let g:vimspector_install_gadgets = [
			\'debugpy',
			\'vscode-cpptools',
			\'CodeLLDB'
			\]
""""""""""

"""""""""" coc
"""""""""" coc extensions
let g:coc_global_extensions = [
			\'coc-pyright',
			\'coc-rust-analyzer',
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
			\'coc-sh',
			\'coc-markmap',
			\'coc-xml'
			\]
"""""""""" coc customizations

" A little color change which looks nicer to me
highlight Pmenu ctermbg=LightYellow

" Give more space for displaying messages.
" set cmdheight=2
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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
" Show call hierarchy
nmap <silent> gch :call CocActionAsync('showIncomingCalls')<cr>
" Use <M-space> to trigger completion.
inoremap <silent><expr> <M-space> coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <CR> to confirm completion
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" run code actions
vmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca <Plug>(coc-codeaction-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Imports` command to organize current buffer.
command! -nargs=0 Imports :call CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Manage extensions.
nnoremap <silent><nowait> <space>ex  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>cm  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

"""""""""" Vista customizations
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction


"""""""""" Go customizations
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
command GoInterface :CocCommand go.impl.cursor
""""""""""

"""""""""" Python customizations
call coc#config('python', {'pythonPath': $PYENV_VIRTUAL_ENV})
command Pyterm :CocCommand 'python.startREPL'
""""""""""

"""""""""" FZF customizations
" Empty value to disable preview window altogether
" let g:fzf_preview_window = []
" let g:fzf_layout = { 'down': '20%' }
" let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0 } }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'up': '40%' }
" let g:fzf_layout = { 'window': '10new' }

nnoremap <leader><leader> :Rg<SPACE>
" nnoremap <leader>f :FZF<CR>
nnoremap <leader>f :Files<CR>
command! -bang IFZF call fzf#run(fzf#wrap({'source': 'fd --type f --hidden --follow --exclude .git'}, <bang>0))
nnoremap <leader>g :IFZF<CR>

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

command MYComment execute 'normal!' 'A'.split(&commentstring, '%s')[0].g:my_comment_prefix
nmap <leader>cc :MYComment<CR>
vmap <leader>cc :MYComment<CR>

""""""""""" Debugger integration shit
let g:termdebug_wide=1

""""""""""" #!! Automatica shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

"""""""""" Add statusline support.
" TODO: Add a simple color support
set statusline=
set statusline+=%0*%m%r%w
set statusline+=%0*\ %y
" set statusline+=%0*\ %<%F
set statusline+=%0*[
set statusline+=%0*%<%f:%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
set statusline+=%0*]
set statusline+=%0*\ %=
set statusline+=%0*\ %{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%0*\ %l/%L
" set statusline+=%0*\ [%l:%L]

""""""""""" colors
" I decided it's better to let the terminal (alacritty in my case) to handle
" colors. So colorschemes are not needed :)
