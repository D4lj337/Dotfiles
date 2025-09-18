return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	opts = {
		theme = "hyper", -- theme is doom and hyper default is hyper
		disable_move = false, -- default is false disable move keymap for hyper
		shortcut_type = "letter",
		config = {},
	},
}
