local black_white_theme = {
	normal = {
		a = { fg = "#FFFFFF", bg = "#000000", gui = "bold" },
		b = { fg = "#FFFFFF", bg = "#000000" },
		c = { fg = "#FFFFFF", bg = "#000000" },
	},
	insert = {
		a = { fg = "#FFFFFF", bg = "#000000", gui = "bold" },
		b = { fg = "#FFFFFF", bg = "#000000" },
		c = { fg = "#FFFFFF", bg = "#000000" },
	},
	visual = {
		a = { fg = "#FFFFFF", bg = "#000000", gui = "bold" },
		b = { fg = "#FFFFFF", bg = "#000000" },
		c = { fg = "#FFFFFF", bg = "#000000" },
	},
	replace = {
		a = { fg = "#FFFFFF", bg = "#000000", gui = "bold" },
		b = { fg = "#FFFFFF", bg = "#000000" },
		c = { fg = "#FFFFFF", bg = "#000000" },
	},
	command = {
		a = { fg = "#FFFFFF", bg = "#000000", gui = "bold" },
		b = { fg = "#FFFFFF", bg = "#000000" },
		c = { fg = "#FFFFFF", bg = "#000000" },
	},
	inactive = {
		a = { fg = "#FFFFFF", bg = "#000000", gui = "bold" },
		b = { fg = "#FFFFFF", bg = "#000000" },
		c = { fg = "#FFFFFF", bg = "#000000" },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	enabled = false,
	event = "VeryLazy", -- optional
	--dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		options = {
			icons_enabled = true,
			theme = black_white_theme,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
				refresh_time = 16, -- ~60fps
				events = {
					"WinEnter",
					"BufEnter",
					"BufWritePost",
					"SessionLoadPost",
					"FileChangedShellPost",
					"VimResized",
					"Filetype",
					"CursorMoved",
					"CursorMovedI",
					"ModeChanged",
				},
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
