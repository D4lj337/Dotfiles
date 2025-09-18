-- Set up the leader key
vim.o.whichwrap = ""

-- Line number
vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"

-- Clipboard
vim.o.clipboard = "unnamedplus"

vim.cmd("let g:netrw_banner = 0")

-- Tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Indent
vim.o.autoindent = true
vim.o.smartindent = true

-- Disable files backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = false

-- Search
vim.o.inccommand = "split"
vim.o.ignorecase = true
vim.o.hlsearch = true

-- Disable line wraping
vim.o.wrap = false

vim.cmd("set completeopt+=noselect")

-- Appearance settings
vim.o.syntax = "on"
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.background = "dark"

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.updatetime = 50
vim.o.colorcolumn = "80"

vim.o.mouse = "a"
vim.g.editconfig = true

-- Fix slow scrolling in the terminal
vim.o.ttyfast = true

-- Colorscheme
--vim.cmd("colorscheme wildcharm")
--vim.cmd.colorscheme("catppuccin")

-- Make comment look good.
--vim.api.nvim_set_hl(0, "Comment", { fg = "#808080", italic = true, blend = 30 })

vim.cmd([[highlight CursorLineNr guifg=#ffffff gui=bold]])
