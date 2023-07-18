return {
		{
			'christoomey/vim-tmux-navigator',
			config = function()
				vim.g.tmux_navigator_disable_when_zoomed = 1
				vim.g.tmux_navigator_no_mappings = 1
				-- TODO: Add terminal mode as well
				vim.keymap.set('n', '<M-h>', '<CMD>TmuxNavigateLeft<CR>', {remap = false, silent =  true})
				vim.keymap.set('i', '<M-h>', '<ESC><CMD>TmuxNavigateLeft<CR>', {remap = false, silent = true})
				vim.keymap.set('n', '<M-l>', '<CMD>TmuxNavigateRight<CR>', {remap = false, silent = true})
				vim.keymap.set('i', '<M-l>', '<ESC><CMD>TmuxNavigateRight<CR>', {remap = false, silent = true})
				vim.keymap.set('n', '<M-k>', '<CMD>TmuxNavigateUp<CR>', {remap = false, silent = false})
				vim.keymap.set('i', '<M-k>', '<ESC><CMD>TmuxNavigateUp<CR>', {remap = false, silent = true})
				vim.keymap.set('n', '<M-j>', '<CMD>TmuxNavigateDown<CR>', {remap = false, silent = true})
				vim.keymap.set('i', '<M-j>', '<ESC><CMD>TmuxNavigateDown<CR>', {remap = false, silent = true})
			end
	},
}

