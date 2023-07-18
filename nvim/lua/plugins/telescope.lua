return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>f', builtin.find_files, {})
			vim.keymap.set('n', '<leader><leader>', builtin.live_grep, {})
			-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		config = function()
			require('telescope').load_extension('fzf')
		end
	},
}
