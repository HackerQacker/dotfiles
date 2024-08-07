return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'nvim-telescope/telescope.nvim' },
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{
				'williamboman/mason.nvim',
				build = ':MasonUpdate',
				config = function()
					require('mason').setup({
						ui = { border = 'rounded' }
					})

					-- See :help mason-lspconfig-settings
					require('mason-lspconfig').setup({
						ensure_installed = {
							'clangd',
							'bufls',
							'gopls',
							'bashls',
							-- Markdown?
							'pyright',
							'rust_analyzer',
							'lua_ls',
							'jsonls',
							'lemminx', -- XML
							'yamlls',
							'tsserver',
							'eslint',
							'html',
							'cssls',
							'terraformls',
							-- 'tailwindcss',
							'dockerls',
							-- 'tilt_ls',
						}
					})

				end
			},
			{ 'williamboman/mason-lspconfig.nvim', lazy = true },
			{ "folke/neodev.nvim",                 opts = {} }
		},

		config = function()
			local lspconfig = require('lspconfig')

			local sign = function(opts)
				-- See :help sign_define()
				vim.fn.sign_define(opts.name, {
					texthl = opts.name,
					text = opts.text,
					numhl = ''
				})
			end

			sign({ name = 'DiagnosticSignError', text = '✘' })
			sign({ name = 'DiagnosticSignWarn', text = '▲' })
			sign({ name = 'DiagnosticSignHint', text = '⚑' })
			sign({ name = 'DiagnosticSignInfo', text = '»' })

			-- See :help vim.diagnostic.config()
			vim.diagnostic.config({
				virtual_text = false,
				severity_sort = true,
				float = {
					border = 'rounded',
					source = 'always',
				},
			})

			vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
				vim.lsp.handlers.hover,
				{ border = 'rounded' }
			)

			vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
				vim.lsp.handlers.signature_help,
				{ border = 'rounded' }
			)

			-- See :help lspconfig-global-defaults
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

			local ts_builtin = require('telescope.builtin')

			vim.api.nvim_create_autocmd("CursorHold", {
				group = group,
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
				end
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				group = group,
				desc = 'LSP actions',
				callback = function()
					local opts = { buffer = true }
					vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, opts)
					-- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
					-- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
					-- vim.keymap.set('n', '<leader>wl', function()
					--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					-- end, opts)
					vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', ts_builtin.lsp_references, opts)
					-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<leader>s', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end
			})

			vim.api.nvim_create_autocmd('BufWritePre', {
				pattern = '*.go',
				callback = function()
					vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
				end
			})

			-- See :help mason-lspconfig-dynamic-server-setup
			require('mason-lspconfig').setup_handlers({
				function(server)
					-- See :help lspconfig-setup
					lspconfig[server].setup({})
				end,
				['tsserver'] = function()
					lspconfig.tsserver.setup({
						settings = {
							completions = {
								completeFunctionCalls = true
							}
						}
					})
				end,
				['clangd'] = function()
					lspconfig.clangd.setup({
						filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }, -- ignoring proto
					})
				end,
			})
		end
	},
}
