local o = vim.opt
local g = vim.g

-- INFO: Set up the leader key
g.mapleader = " "
o.whichwrap = ""

-- INFO: Set general options
o.number = true
o.relativenumber = true
o.wrap = true
o.linebreak = true
o.breakindent = true
o.swapfile = false
o.shiftwidth = 4
o.signcolumn = "yes"
o.textwidth = 80
g.mapleader = " "
o.winborder = "rounded"

-- INFO: Indent
o.autoindent = true
o.smartindent = true
o.smarttab = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.clipboard = "unnamedplus"

-- INFO: Disable files backup
o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = false

vim.cmd("set completeopt+=noselect")

-- INFO: Appearance settings
o.syntax = "on"
o.termguicolors = true
o.cursorline = true
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true
o.splitbelow = true

-- INFO: Fix slow scrolling in the terminal
o.ttyfast = true

-- INFO: Colorscheme
--vim.cmd("colorscheme wildcharm")
--vim.cmd.colorscheme("catppuccin")

-- INFO: Make comment look good.
--vim.api.nvim_set_hl(0, "Comment", { fg = "#808080", italic = true, blend = 30 })

vim.cmd([[highlight CursorLineNr guifg=#ffffff gui=bold]])

-- INFO: Dots
o.list = true
o.listchars = {
	space = "·",
	tab = ". ",
	trail = "·",
	extends = ".",
	precedes = ".",
}

--  INFO: Spell
o.spell = false
o.spelllang = "en_us"
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20"

-- INFO Disable fold
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.fillchars = { fold = " " }
o.foldmethod = "indent"
o.foldenable = false
o.foldlevel = 99

-- INFO Highlight the current line number
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "yellow", bold = true })
	end,
})
