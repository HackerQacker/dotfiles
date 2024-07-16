
vim.opt.hidden = true
-- vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.updatetime = 300
vim.opt.clipboard = 'unnamedplus'
vim.opt.splitbelow = true
vim.opt.splitright = true
-- vim.opt.termguicolors = true
-- vim.opt.shortmess = vim.opt.shortmess .. "c"


vim.g.mapleader = ' '

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

local group = vim.api.nvim_create_augroup('user_cmds', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = group,
  callback = function()
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'help', 'man'},
  group = group,
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

-- vim.api.nvim_set_hl(0, 'Pmenu', {ctermfg='White', ctermbg='DarkGrey', guibg=Grey})
vim.api.nvim_set_hl(0, 'Pmenu', {ctermfg='White', ctermbg='Black', guibg=Grey})
