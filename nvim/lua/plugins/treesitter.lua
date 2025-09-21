return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	--event = "VimEnter",
	--	lazy = true,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"bash",
			"comment",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"python",
			"javascript",
			"jason",
			"regex",
			"query",
			"toml",
			"yaml",
			"udev",
			"git_config",
			"diff",
			"luadoc",
			"tmux",
			"cpp",
			"php",
			"typescript",
			"tsx",
			"commonlisp",
			"norg",
			"sql",
		},
		sync_install = true,
		auto_install = true,
		ignore_install = { "org" },
		indent = { enable = true },
		autotags = { enable = true },
		highlight = {
			enable = true,
			use_languagetree = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB,
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
	},
}

--vim.o.foldmethod = "expr"
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"
--vim.o.foldlevel = 99
