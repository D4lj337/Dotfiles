vim.loader.enable()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- INFO: Main files
require("config.performance-optimizations")
require("config.remap")
require("config.options")
require("config.lsp")
require("config.lazy")

vim.o.winborder = "rounded"
vim.cmd.colorscheme("simple-dark")

-- Set zathura as the default handler for PDFs
vim.g.netrw_browsex_viewer = "zathura"

vim.keymap.set("n", "<leader>dc", function()
	vim.cmd("%s/--.*$//g")
	vim.cmd("%s/^\\s*$//gd")
end, { noremap = true, silent = true })
