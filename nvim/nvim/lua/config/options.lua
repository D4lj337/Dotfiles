vim.cmd.colorscheme("ef-autumn")
vim.o.relativenumber = true
vim.g.netrw_banner = 0

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
	vim.hl.on_yank()
end,
})
