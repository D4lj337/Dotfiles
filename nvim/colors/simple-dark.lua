-- simple_dark.lua
-- Converted from Vim script to Lua for Neovim

-- Clear existing highlights
vim.cmd("highlight clear")
vim.opt.background = "dark"
vim.g.colors_name = "simple-dark"

local set = vim.api.nvim_set_hl
local c = {
	bg = "#0a0a0a",
	fg = "#bcbcbc",
	white = "#eeeeee",
	light = "#d0d0d0",
	gray = "#8a8a8a",
	dark = "#585858",
	black = "#000000",
	bg_alt = "#0f0f0f",
	red = "#ff0000",
	cursor = "#31353f",
}

-- Base highlight groups
set(0, "Normal", { fg = c.fg, bg = c.bg })
set(0, "NonText", { fg = c.bg, bg = c.bg })
set(0, "Keyword", { fg = c.white, bg = c.bg })
set(0, "Constant", { fg = c.light, bg = c.bg })
set(0, "String", { fg = c.gray, bg = c.bg })
set(0, "Comment", { fg = c.dark, bg = c.bg, italic = true, bold = true })
set(0, "Number", { fg = c.white, bg = c.bg })
set(0, "Error", { fg = c.white, bg = c.bg })
set(0, "ErrorMsg", { fg = c.white, bg = c.bg })
set(0, "Search", { fg = c.gray, bg = c.bg })
set(0, "IncSearch", { fg = c.white, bg = c.bg, reverse = true })
set(0, "DiffChange", { fg = c.gray, bg = c.bg })
set(0, "DiffText", { fg = c.fg, bg = c.bg })
set(0, "SignColumn", { fg = c.gray, bg = c.bg })
set(0, "SpellBad", { fg = c.white, bg = c.gray, undercurl = true })
set(0, "SpellCap", { fg = c.white, bg = "#7f0000" }) -- 124
set(0, "SpellRare", { fg = c.gray, bg = "#000000" }) -- 16
set(0, "WildMenu", { fg = c.dark, bg = c.fg })
set(0, "Pmenu", { fg = c.white, bg = c.dark })
set(0, "PmenuThumb", { fg = "#080808", bg = c.bg })
set(0, "SpecialKey", { fg = c.white, bg = c.bg })
set(0, "MatchParen", { fg = c.white, bg = c.bg })
set(0, "CursorLine", { bg = c.bg })
set(0, "StatusLine", { fg = c.gray, bg = c.bg, bold = true, reverse = true })
set(0, "StatusLineNC", { fg = "#303030", bg = c.bg, reverse = true })
set(0, "Visual", { fg = c.fg, bg = c.bg, reverse = true })
set(0, "VertSplit", { fg = c.bg, bg = c.bg })
set(0, "TermCursor", { reverse = true })
set(0, "ColorColumn", { reverse = true })
set(0, "debugBreakpoint", { fg = c.red, bg = c.cursor, undercurl = true })

-- Links (these follow the original file)
vim.cmd([[
  highlight! link Boolean Normal
  highlight! link Delimiter Normal
  highlight! link Identifier Normal
  highlight! link Title Normal
  highlight! link Debug Normal
  highlight! link Exception Normal
  highlight! link FoldColumn Normal
  highlight! link Macro Normal
  highlight! link ModeMsg Normal
  highlight! link MoreMsg Normal
  highlight! link Question Normal
  highlight! link Conditional Keyword
  highlight! link Statement Keyword
  highlight! link Operator Keyword
  highlight! link Structure Keyword
  highlight! link Function Keyword
  highlight! link Include Keyword
  highlight! link Type Keyword
  highlight! link Typedef Keyword
  highlight! link Todo Keyword
  highlight! link Label Keyword
  highlight! link Define Keyword
  highlight! link DiffAdd Keyword
  highlight! link diffAdded Keyword
  highlight! link diffCommon Keyword
  highlight! link Directory Keyword
  highlight! link PreCondit Keyword
  highlight! link PreProc Keyword
  highlight! link Repeat Keyword
  highlight! link Special Keyword
  highlight! link SpecialChar Keyword
  highlight! link StorageClass Keyword
  highlight! link SpecialComment String
  highlight! link CursorLineNr String
  highlight! link Character Number
  highlight! link Float Number
  highlight! link Tag Number
  highlight! link Folded Number
  highlight! link WarningMsg Number
  highlight! link iCursor SpecialKey
  highlight! link SpellLocal SpellCap
  highlight! link LineNr Comment
  highlight! link NonText NonText
  highlight! link DiffDelete Comment
  highlight! link diffRemoved Comment
  highlight! link PmenuSbar Visual
  highlight! link PmenuSel Visual
  highlight! link VisualNOS Visual
  highlight! link VertSplit VertSplit
  highlight! link Cursor StatusLine
  highlight! link Underlined SpellRare
  highlight! link rstEmphasis SpellRare
  highlight! link diffChanged DiffChange
]])
