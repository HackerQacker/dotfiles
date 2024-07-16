return {
	{ 'nvim-lua/plenary.nvim' },
	-- Useful for GitBlame
	{ 'tpope/vim-fugitive' },
	{ 'numToStr/Comment.nvim',              config = function() require('Comment').setup({}) end },
	{ 'github/copilot.vim' },
}
