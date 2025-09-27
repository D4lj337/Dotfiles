-- INFO:- - Neovide settings
if vim.g.neovide then
	vim.g.neovide_scale_factor = 1.0
	vim.o.guifont = "JetBrains Mono:h5"
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	-- vim.g.neovide_theme = 'auto'
	vim.g.neovide_cursor_hack = true
	vim.g.neovide_cursor_animation_length = 0
end

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

-- INFO: Set the make command for C/C++ files (adjust based on your project)

vim.g.makeprg = "gcc -O3 -march=native -flto -fno-rtti -o %:r % && ./%:r" -- Adjust for your project

-- Function to trigger compilation
local function compile_code()
	vim.cmd("make") -- Runs the `make` command in Neovim
end

-- Keymap for compiling code (leader+c), you can adjust the leader key if needed
vim.api.nvim_set_keymap("n", "<leader>c", ":lua compile_code()<CR>", { noremap = true, silent = true })

-- Automatically open the quickfix window after running make
vim.cmd([[autocmd QuickFixCmdPost make nested copen]])

-- Optionally, set up a custom function for handling tmux integration
vim.cmd([[
  function! TmuxCompile()
    " This function will trigger the tmux keybinding for C-c c
    silent !tmux send-keys -t 0 ':make<CR>'
  endfunction
]])

-- Bind the function to a key (for example, <leader>tmux to trigger tmux compile)
vim.api.nvim_set_keymap("n", "<leader>tmux", ":call TmuxCompile()<CR>", { noremap = true, silent = true })
