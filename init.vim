" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-dispatch'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'fatih/vim-go'
Plug 'arakashic/chromatica.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number relativenumber

" vim-tmux-navigator customizations
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <M-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

nmap <C-n> :NERDTreeToggle<CR>

" TODO: nerdcommenter shits

" Markdown settings
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

