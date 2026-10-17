return {
	"nvim-neorg/neorg",
	ft = { "norg" },
	--lazy = false,
	version = "*",
	--	config = true,
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.tangle"] = {},
			["core.dirman"] = {
				config = {
					icon_presnet = "varied",
					workspaces = {
						notes = "~/notes",
					},
					default_workspace = "notes",
				},
			},
		},
	},
}
