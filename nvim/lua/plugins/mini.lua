return {
	{"nvim-mini/mini.ai"},
	{"nvim-mini/mini.surround"},
	{"nvim-mini/mini.operators"},
	{"nvim-mini/mini.pairs"},
	{"nvim-mini/mini.bracketed"},
	{"nvim-mini/mini.files"},
	event = "VeryLazy",
	config = function()
	require('mini.ai').setup()
	require('mini.surround').setup()
	require('mini.operators').setup()
	require('mini.pairs').setup()
	require('mini.bracketed').setup()
	require('mini.files').setup()
end,
}
