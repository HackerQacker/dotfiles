return {
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		event = { "CmdlineEnter" },
		ft = { "go", 'gomod' },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries

		config = function()
			require("go").setup()

			-- vim.api.nvim_create_autocmd('BufWritePre', {
			-- 	pattern = '*.go',
			-- 	callback = function()
			-- 		vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
			-- 	end
			-- })

			local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					require('go.format').goimport()
				end,
				group = format_sync_grp,
			})
		end,
	}
}
