return {
	"nvim-tree/nvim-web-devicons",
	event = "LSPAttach",
	config = function()
		require("nvim-web-devicons").setup({})
	end,
}
