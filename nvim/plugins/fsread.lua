return {
	"nullchilly/fsread.nvim",
	opts = {
		flow_strength = 0.7, -- low: 0.3, middle: 0.5, high: 0.7 (default)
		highlights = {
			FSPrefix = { fg = "#cdd6f4" },
			FSSuffix = { fg = "#6C7086" },
		},
	},
	config = function(_, opts)
		vim.g.flow_strength = opts.flow_strength
		for group, hl in pairs(opts.highlights) do
			vim.api.nvim_set_hl(0, group, hl)
		end
	end,
}
