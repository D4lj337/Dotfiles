return {
	"nvim-mini/mini.pick", 
	version = '*',
	event = "VeryLazy",
	config = function()
		require('mini.pick').setup()
	end,
}
