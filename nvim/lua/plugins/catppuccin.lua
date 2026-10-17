-- INFO: Catppuccin theme
return {
	{
		"catppuccin/nvim",
		--event = "VeryLazy",
		name = "catppuccin",
		lazy = true,
		priority = 1000,
		opts = {
			transparent_background = false, -- disables setting the background color.
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false, -- use solid styling for floating windows, see |winborder|
			},
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = {}, -- Change the style of comments
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = { "bold" },
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {
				all = {
					text = "#ffffff",
				},
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			custom_highlights = {},
			default_integrations = true,
			auto_integrations = false,
			integrations = {
				nvimtree = true,
				treesitter = true,
				blink_cmp = true,
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				fzf = true,
				grug_far = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				snacks = true,
				telescope = true,
				treesitter_context = true,
				which_key = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		},
	},
}
