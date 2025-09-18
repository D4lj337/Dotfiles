-- INFO:

-- Extend or override Telescope configuration for LazyVim
return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "master", -- avoiding deprecated warnings, use latest stable if preferred
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/which-key.nvim",
			"andrew-george/telescope-themes", -- optional, for themes
		},
		opts = {
			defaults = {
				prompt_prefix = "🔍 ",
				selection_caret = "➜ ",
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-c>"] = require("telescope.actions").close,
					},
					n = {
						q = require("telescope.actions").close,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
			},
			extensions = {
				-- optional extensions setup
			},
		},
		-- Keybindings for Telescope commands
		config = function()
			local wk = require("which-key")
			local opts = { noremap = true, silent = true }
			local keymap = vim.api.nvim_set_keymap
			keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
			keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
			keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
			keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

			keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", opts)
			keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", opts)
			keymap("n", "<leader>ss", "<cmd>Telescope builtin<cr>", opts)
			keymap("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", opts)
			keymap("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", opts)
			keymap("n", "<leader>sr", "<cmd>Telescope resume<cr>", opts)
			keymap("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>", opts)
			keymap("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", opts)
		end,
	},
}
