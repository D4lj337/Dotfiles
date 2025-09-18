return {
	"mason-org/mason-lspconfig.nvim",
	event = "LspAttach",
	cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
	opts = {
		ensure_installed = {
			"lua_ls", -- lua
			"pylsp", -- python
			"bashls", -- bash
			"cssls", -- css
			"clangd", -- c/c++
			"html", -- html
			"textlsp", -- org,text,latex
			"ruff", -- python
			"pyright", -- python
		},
		automatic_enable = {
			"lua_ls",
		},
		automatic_installation = true,
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
