vim.pack.add({
	'https://github.com/nvim-mini/mini.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/oonamo/ef-themes.nvim',
	'https://github.com/m4xshen/hardtime.nvim',
	'https://github.com/folke/flash.nvim',
	'https://github.com/j-hui/fidget.nvim',
})

require('mini.basics').setup()
require('mini.surround').setup()
require('ef-themes').setup()
require("hardtime").setup()
require('flash').setup()
require('fidget').setup()
vim.lsp.enable({ 'lua_ls', 'clangd' })
