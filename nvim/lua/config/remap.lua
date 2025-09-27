local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>oo", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>c", ":", { noremap = true })

--vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
--vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
--vim.keymap.set('n', '<leader>E', ":Oil <CR>")

-- Terminal
vim.keymap.set("n", "<leader>t", ":botright term <CR>")
vim.keymap.set("n", "<leader>T", ":term <CR>")

-- Insert mode in terminal mode.
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})

-- Lsp
vim.keymap.set("n", "<Leader>ds", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Formatting
local function formatter()
	require("conform").format({ async = true })
	print("Yay! Formatting")
end
vim.keymap.set("n", "<leader>f", formatter, {})

-- Visit config
vim.keymap.set("n", "<leader>e", ":edit ~/.config/nvim/init.lua<CR>")
