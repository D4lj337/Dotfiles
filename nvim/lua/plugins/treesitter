return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			mode = "statusline",
			ensure_installed = {
				"rst",
				"bash",
				"c",
				"cpp",
				"python",
				"vim",
				"comment",
				"rust",
				"vimdoc",
				"query",
				"regex",
				"toml",
				"git_config",
				"luadoc",
				"tmux",
				"php",
				"commonlisp",
				"norg",
				"sql",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"go",
				"markdown",
				"markdown_inline",
				"python",
				"tsx",
				"typescript",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			rainbow = {
				enable = true,
				disable = { "html" },
				extended_mode = false,
				max_file_lines = nil,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			folds = { enable = true },
			ignore_install = { "org" },
		})
	end,
}
