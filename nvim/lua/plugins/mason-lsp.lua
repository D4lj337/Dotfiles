return {
	"mason-org/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	--	cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
	opts = {
		ensure_installed = {
			"lua_ls", -- lua
			"pylsp", -- python
			"clangd", -- c/c++
			"textlsp", -- org,text,latex
			--			"sqls", -- sql
			"ruff", -- python
		},
		automatic_enable = {
			"lua_ls",
		},
		automatic_installation = true,
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},
}
