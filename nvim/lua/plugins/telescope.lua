-- INFO:
return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = { "<leader>s.", "<leader>ff", "<leader>fg" },
		branch = "master", -- avoiding deprecated warnings, use latest stable if preferred
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			--"nvim-tree/nvim-web-devicons",
			--event = "VimEnter",
			"folke/which-key.nvim",
			event = "VeryLazy",

			"andrew-george/telescope-themes",
			event = "VimEnter",

			"nvim-telescope/telescope-file-browser.nvim",
			event = "VimEnter",

			"crispgm/telescope-heading.nvim",
		},
		opts = {
			defaults = {
				prompt_prefix = "🔍 ",
				selection_caret = "➜ ",
				path_display = { "smart" },
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					find_command = {
						"rg",
						"--files",
						"--glob",
						"*.org",
					},
				},
			},
			extensions = {
				heading = {
					picker_opts = {
						layout_config = {
							width = 0.8,
							preview_width = 0.5,
						},
						layout_strategy = "horizontal",
					},
					treesitter = true,
				},
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
					mappings = {
						["i"] = {},
						["n"] = {},
					},
				},
			},
		},
		-- Keybindings for Telescope commands
		config = function()
			require("telescope").load_extension("noice")
			require("telescope").load_extension("heading")
			--			require("telescope").load_extension("orgmode")
			local wk = require("which-key")
			local opts = { noremap = true, silent = true }
			local keymap = vim.api.nvim_set_keymap
			keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
			keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
			keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
			keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
			keymap("n", "<leader>fc", "<cmd>Telescope file_browser<cr>", opts)
			keymap("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>", opts)

			keymap("n", "<leader>j", "<cmd>Telescope jumplist<cr>", opts)

			keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", opts)
			keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", opts)
			keymap("n", "<leader>ss", "<cmd>Telescope builtin<cr>", opts)
			keymap("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", opts)
			keymap("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", opts)
			keymap("n", "<leader>sr", "<cmd>Telescope resume<cr>", opts)
			keymap("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", opts)
			keymap("n", "<leader>or", "<cmd>Telescope orgmode search_headings<cr>", opts)
		end,
	},
}
