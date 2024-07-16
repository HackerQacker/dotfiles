return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>f', function()
				builtin.find_files({ find_command = { "fd", "-u" } })
			end, {})
			vim.keymap.set('n', '<leader>g', builtin.find_files, {})
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
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("file_browser")
			vim.api.nvim_set_keymap("n", "<leader>e", ":Telescope file_browser<CR>", { noremap = true })
		end
	},
}
