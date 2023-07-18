return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdateSync",
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
				},
				ensure_installed = {
					'javascript',
					'typescript',
					'tsx',
					'lua',
					'vim',
					'vimdoc',
					'css',
					'json',
					'go',
					'python',
					'rust',
					'make',
					'markdown',
					'html',
				},
			})
		end
	},
}
