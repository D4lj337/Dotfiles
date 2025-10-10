return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
		opts = {
			enable = true,
			sign = true,
			--    virtual_text = true,
			--    debounce = 10,
			--    sign_priority = 40,
		},
	},
}
