return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"python",
			"javascript",
			"tmux",
			"cpp",
			"commonlisp",
		},
		sync_install = false,
		auto_install = true,
		ignore_install = { "org" },
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
