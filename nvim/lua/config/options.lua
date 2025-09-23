-- INFO: Set up the leader key
vim.g.mapleader = " "
vim.o.whichwrap = ""

-- INFO: Set general options
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.textwidth = 100
vim.g.mapleader = " "
vim.o.winborder = "rounded"

-- INFO: Indent
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.clipboard = "unnamedplus"

-- INFO: Disable files backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = false

-- INFO: Disable line wraping
vim.o.wrap = false

vim.cmd("set completeopt+=noselect")

-- INFO: Appearance settings
vim.o.syntax = "on"
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- INFO: Fix slow scrolling in the terminal
vim.o.ttyfast = true

-- INFO: Colorscheme
--vim.cmd("colorscheme wildcharm")
--vim.cmd.colorscheme("catppuccin")

-- INFO: Make comment look good.
--vim.api.nvim_set_hl(0, "Comment", { fg = "#808080", italic = true, blend = 30 })

vim.cmd([[highlight CursorLineNr guifg=#ffffff gui=bold]])

-- INFO: Dots
vim.opt.list = true
vim.opt.listchars = {
	space = "·",
	tab = ". ",
	trail = "·",
	extends = ".",
	precedes = ".",
}

-- INFO: Spell
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20"

-- Disable fold
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
