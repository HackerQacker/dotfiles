return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = { "nvim-treesitter/nvim-treesitter-refactor" },
		build = ":TSUpdateSync",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true
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
					'gomod',
					'proto',
					'python',
					'rust',
					'make',
					'mermaid',
					'markdown',
					'markdown_inline',
					'html',
					'yaml',
					'bash',
				},
				refactor = {
					enable = true,
				}
			})
		end
	},
}
