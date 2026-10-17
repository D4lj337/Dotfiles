-- Define a custom highlight group for the breakpoint sign
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#ff0000", bg = nil }) -- bright red foreground

-- Define the breakpoint sign with the custom highlight
vim.fn.sign_define("DapBreakpoint", {
	text = "●", -- breakpoint icon, you can change to your preference
	texthl = "DapBreakpoint", -- use the above highlight group
	linehl = "", -- no line highlight
	numhl = "", -- no number column highlight
})
