-- Set up the leader key
vim.g.mapleader = " "
vim.o.whichwrap = ""

-- Set general options
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.clipboard = "unnamedplus"

-- Disable files backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = false

-- Disable line wraping
vim.o.wrap = false

vim.cmd("set completeopt+=noselect")

-- Appearance settings
vim.o.syntax = "on"
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- Fix slow scrolling in the terminal
vim.o.ttyfast = true

-- Colorscheme
--vim.cmd("colorscheme wildcharm")
--vim.cmd.colorscheme("catppuccin")

-- Make comment look good.
--vim.api.nvim_set_hl(0, "Comment", { fg = "#808080", italic = true, blend = 30 })

vim.cmd([[highlight CursorLineNr guifg=#ffffff gui=bold]])
