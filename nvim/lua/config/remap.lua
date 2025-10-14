local g = vim.g
local map = vim.keymap.set

g.mapleader = " "
g.maplocalleader = " "

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>oo", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<leader>c", ":", { noremap = true })
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { noremap = true })
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { noremap = true })
map("n", "<M-x>", ":Telescope commands<CR>", { noremap = true })

-- Terminal
map("n", "<leader>t", ":botright term <CR>")
map("n", "<leader>T", ":term <CR>")

-- Insert mode in terminal mode.
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})

-- Lsp
map("n", "<Leader>ds", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

---- Formatting
local function formatter()
	require("conform").format({ async = true })
	print("Yay! Formatting")
end
map("n", "<leader>f", formatter, {})
