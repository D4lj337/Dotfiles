-- INFO: Compile-mode taken from the Emacs to Neovim.
return {
	"ej-shafran/compile-mode.nvim",
	event = "VeryLazy",
	--	version = "^5.0.0",
	branch = "latest",
	-- you can just use the latest version:
	-- branch = "latest",
	-- or the most up-to-date updates:
	-- branch = "nightly",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- if you want to enable coloring of ANSI escape codes in
		-- compilation output, add:
		{ "m00qek/baleia.nvim", tag = "v1.3.0" },
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			-- to add ANSI escape code support, add:
			baleia_setup = true,
			bang_expansion = true,
			-- to make `:Compile` replace special characters (e.g. `%`) in
			-- the command (and behave more like `:!`), add:
			-- bang_expansion = true,
		}

		-- Auto resize compilation buffer window on open
		vim.api.nvim_create_autocmd("BufWinEnter", {
			pattern = "*",
			callback = function()
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					local buf = vim.api.nvim_win_get_buf(win)
					local buf_name = vim.api.nvim_buf_get_name(buf)
					if buf_name:match("compilation") then
						vim.api.nvim_win_set_height(win, 10)
						-- Uncomment to set width as well
						-- vim.api.nvim_win_set_width(win, 80)
					end
				end
			end,
		})

		local run_cmds = {
			go = "go run %",
			c = "gcc % -o /tmp/a.out && /tmp/a.out<CR>",
			lua = "lua %",
			python = "python3 %",
		}

		for ft, cmd in pairs(run_cmds) do
			vim.api.nvim_create_autocmd("FileType", {
				pattern = ft,
				callback = function()
					vim.api.nvim_buf_set_keymap(
						0,
						"n",
						"<leader>rr",
						":Compile " .. cmd .. "<CR>",
						{ noremap = true, silent = true }
					)
				end,
			})
		end
	end,
}
