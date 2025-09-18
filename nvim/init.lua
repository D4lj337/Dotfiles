-- INFO:- - Neovide settings
if vim.g.neovide then
	vim.g.neovide_scale_factor = 1.0
	vim.o.guifont = "JetBrains Mono:h9"
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	-- vim.g.neovide_theme = 'auto'
	vim.g.neovide_cursor_hack = true
	vim.g.neovide_cursor_animation_length = 0
end

-- INFO: Main files
require("config.remap")
require("config.lazy")
require("config.options")
require("config.lsp")

-- INFO: Theme
vim.cmd.colorscheme("catppuccin")

-- INFO: Ask before quitting
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		-- Check if any visible buffer has unsaved changes
		local modified = false
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local buf = vim.api.nvim_win_get_buf(win)
			if vim.api.nvim_buf_get_option(buf, "modified") and vim.api.nvim_buf_get_option(buf, "buftype") == "" then
				modified = true
				break
			end
		end

		local prompt = modified and "You have unsaved changes. Quit anyway? (y/N): " or "Quit Neovim? (y/N): "
		local answer = vim.fn.input(prompt)
		if answer:lower() ~= "y" then
			vim.api.nvim_err_writeln("Quit canceled")
			error("Quit canceled", 0) -- abort quitting
		end
	end,
})
