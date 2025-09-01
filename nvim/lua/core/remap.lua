vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>E', ":Oil <CR>")
vim.keymap.set('n', '<leader>T', ":term <CR>")
vim.keymap.set('n', '<leader>e', ":edit ~/.config/nvim/init.lua<CR>")

-- Terminal
vim.keymap.set('n', '<leader>t', ":botright term <CR>")

-- Insert mode in terminal mode.
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert",
})
