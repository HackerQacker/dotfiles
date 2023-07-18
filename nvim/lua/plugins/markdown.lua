-- TODO: Fucking fix the shit below
function Open_chrome_in_new_popup(url)
	vim.fn.system({
		'open',
		'-na',
		'"Google Chrome"',
		'--args',
		'--app='..url,
	})
end

function Open_mac_chromium_in_new_popup(url)
    vim.fn.system({
		'open',
		'-na',
		'"Chromium"',
		'--args',
		'--app',
		url,
	})
end

vim.cmd(
[[
function Open_mac_chrome_in_new_popup(url)
    exe 'silent !open -na "Google Chrome" --args --app=' . a:url
endfunction
]]
)
if vim.fn.has('macunix') then
	-- Uhh! that's dirty
	vim.g.mkdp_browserfunc = 'Open_mac_chrome_in_new_popup'
end

return {
	{
		'iamcco/markdown-preview.nvim',
		build = "cd app && npm install",
		ft = "markdown",
		lazy = true,
		config = function()
		end
	}
}

