-- Neovide settings
if vim.g.neovide then
	vim.g.neovide_scale_factor = 1.0
	vim.o.guifont = "JetBrains Mono:h9"
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	-- vim.g.neovide_theme = 'auto'
	vim.g.neovide_cursor_hack = true
	vim.g.neovide_cursor_animation_length = 0
end

require("core.options")
require("core.remap")
require("core.lsp")
require("core.packmanager")
require("core.plugins.lualine")
require("core.plugins.catppuccin")
require("core.plugins.dashboard")
require("core.plugins.mason")
require("core.plugins.mason-lsp")
require("core.plugins.mini-icons")
require("core.plugins.mini-pick")
require("core.plugins.nvim-autopairs")
require("core.plugins.nvim-web-devicons")
require("core.plugins.orgmode")
--require("core.plugins.neorg")
require("core.plugins.telescope")
require("core.plugins.treesitter")
require("core.plugins.todo-comments")
require("core.plugins.conform")
require("core.plugins.noice")
--require("core.plugins.notify")
--require("core.plugins.nui")
--require("core.plugins.mini")

vim.cmd.colorscheme("catppuccin")
