" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


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


