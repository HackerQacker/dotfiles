
require('settings')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup('plugins')


--local lazy = {}

--function lazy.install(path)
--  if not vim.loop.fs_stat(path) then
--    print('Installing lazy.nvim....')
--    vim.fn.system({
--      'git',
--      'clone',
--      '--filter=blob:none',
--      'https://github.com/folke/lazy.nvim.git',
--      '--branch=stable', -- latest stable release
--      path,
--    })
--  end
--end

--function lazy.setup(plugins)
--  -- You can "comment out" the line below after lazy.nvim is installed
--  lazy.install(lazy.path)

--  vim.opt.rtp:prepend(lazy.path)
--  require('lazy').setup(plugins, lazy.opts)
--end

--lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
--lazy.opts = {}


--lazy.setup({
--	{'christoomey/vim-tmux-navigator'},
--	{'nvim-lua/plenary.nvim'},
--	-- Useful for GitBlame
--	{'tpope/vim-fugitive'}, 
--	-- File explore
--	{'nvim-telescope/telescope.nvim', branch = '0.1.x'},
--	{'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
--	-- Code
--  {'numToStr/Comment.nvim', config = function() require('Comment').setup({}) end},
--	{'nvim-treesitter/nvim-treesitter'}, 
--	-- LSP support
--	{'neovim/nvim-lspconfig'},
--	{
--		'williamboman/mason.nvim',
--		build = ':MasonUpdate',
--	},
--	{'williamboman/mason-lspconfig.nvim'},
--	-- Autocomplete
--	{'hrsh7th/nvim-cmp'},
--	{'hrsh7th/cmp-buffer'},
--	{'hrsh7th/cmp-path'},
--	{'saadparwaiz1/cmp_luasnip'},
--	{'hrsh7th/cmp-nvim-lsp'},

--	  {'L3MON4D3/LuaSnip'},

--	-- Markdown preview
--	{
--		'iamcco/markdown-preview.nvim',
--		build = "cd app && npm install",
--		ft = "markdown",
--		lazy = true,
--	},
--})



---- TODO: Fucking fix the shit below
--function Open_chrome_in_new_popup(url)
--	vim.fn.system({
--		'open',
--		'-na',
--		'"Google Chrome"',
--		'--args',
--		'--app='..url,
--	})
--end

--function Open_mac_chromium_in_new_popup(url)
--    vim.fn.system({
--		'open',
--		'-na',
--		'"Chromium"',
--		'--args',
--		'--app',
--		url,
--	})
--end

--vim.cmd(
--[[
--function Open_mac_chrome_in_new_popup(url)
--    exe 'silent !open -na "Google Chrome" --args --app=' . a:url
--endfunction
--]]
--)
--if vim.fn.has('macunix') then
--	-- Uhh! that's dirty
--	vim.g.mkdp_browserfunc = 'Open_mac_chrome_in_new_popup'
--end


-----
---- Treesitter
-----
---- See :help nvim-treesitter-modules
--require('nvim-treesitter.configs').setup({
--  highlight = {
--    enable = true,
--  },
--  ensure_installed = {
--    'javascript',
--    'typescript',
--    'tsx',
--    'lua',
--    'vim',
--    'vimdoc',
--    'css',
--    'json',
--	'go',
--	'python',
--	'rust',
--	'markdown',
--  },
--})




-----
---- Comment.nvim
-----


--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>f', builtin.find_files, {})
--vim.keymap.set('n', '<leader><leader>', builtin.live_grep, {})
---- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
---- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--require('telescope').load_extension('fzf')


--require('luasnip.loaders.from_vscode').lazy_load()
-----
---- nvim-cmp (autocomplete)
-----
--vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

--local cmp = require('cmp')
--local luasnip = require('luasnip')

--local select_opts = {behavior = cmp.SelectBehavior.Select}

---- See :help cmp-config
--cmp.setup({
--  snippet = {
--    expand = function(args)
--      luasnip.lsp_expand(args.body)
--    end
--  },
--  sources = {
--    {name = 'path'},
--    {name = 'nvim_lsp'},
--    {name = 'buffer', keyword_length = 3},
--    {name = 'luasnip', keyword_length = 2},
--  },
--  window = {
--    completion = cmp.config.window.bordered(),
--    documentation = cmp.config.window.bordered(),
--  },
--  -- See :help cmp-mapping
--  mapping = {
--    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
--    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
--    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
--    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

--    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-d>'] = cmp.mapping.scroll_docs(4),

--    ['<C-e>'] = cmp.mapping.abort(),
--    ['<CR>'] = cmp.mapping.confirm({select = false}),

--    ['<Tab>'] = cmp.mapping(function(fallback)
--      local col = vim.fn.col('.') - 1

--      if cmp.visible() then
--        cmp.select_next_item(select_opts)
--      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--        fallback()
--      else
--        cmp.complete()
--      end
--    end, {'i', 's'}),

--    ['<S-Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item(select_opts)
--      else
--        fallback()
--      end
--    end, {'i', 's'}),
--  },
--})

--require('mason').setup({
--  -- ui = {border = 'rounded'}
--})

---- See :help mason-lspconfig-settings
--require('mason-lspconfig').setup({
--	ensure_installed = {
--		'clangd',
--		'bufls',
--		'gopls',
--		'bashls',
--		-- Markdown?
--		'pyright',
--		'rust_analyzer',
--		'lua_ls',
--		'jsonls',
--		'lemminx', -- XML
--		'yamlls',
--		'tsserver',
--		'eslint',
--		'html',
--		'cssls',
--		-- 'tailwindcss',
--		'dockerls',
--	}
--})

--local lspconfig = require('lspconfig')
--local lsp_defaults = lspconfig.util.default_config

--lsp_defaults.capabilities = vim.tbl_deep_extend(
--  'force',
--  lsp_defaults.capabilities,
--  require('cmp_nvim_lsp').default_capabilities()
--)

-----
---- Diagnostic customization
-----
--local sign = function(opts)
--  vim.fn.sign_define(opts.name, {
--    texthl = opts.name,
--    text = opts.text,
--    numhl = ''
--  })
--end

--sign({name = 'DiagnosticSignError', text = '✘'})
--sign({name = 'DiagnosticSignWarn', text = '▲'})
--sign({name = 'DiagnosticSignHint', text = '⚑'})
--sign({name = 'DiagnosticSignInfo', text = '»'})

--vim.diagnostic.config({
--  virtual_text = false,
--  severity_sort = true,
--  float = {
--    border = 'rounded',
--    source = 'always',
--  },
--})

--vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
--  vim.lsp.handlers.hover,
--  {border = 'rounded'}
--)

--vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
--  vim.lsp.handlers.signature_help,
--  {border = 'rounded'}
--)


--vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
--vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
--vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
---- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

---- Use LspAttach autocommand to only map the following keys
---- after the language server attaches to the current buffer
--vim.api.nvim_create_autocmd('LspAttach', {
--	  desc = 'LSP actions',
--  group = group,
--  callback = function(ev)
--    -- Buffer local mappings.
--    -- See `:help vim.lsp.*` for documentation on any of the below functions
--    local opts = { buffer = ev.buf }
--    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
--    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
--    -- vim.keymap.set('n', '<leader>wl', function()
--    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--    -- end, opts)
--    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
--    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
--    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--    vim.keymap.set('n', '<leader>F', function()
--      vim.lsp.buf.format { async = true }
--    end, opts)
--  end,
--})

