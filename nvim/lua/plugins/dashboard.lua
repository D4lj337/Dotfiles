--return {
--	"nvimdev/dashboard-nvim",
--	event = "VimEnter",
--	dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
--	opts = {
--		theme = "hyper",
--		config = {
--			week_header = {
--				enable = true,
--			},
--			shortcut = {
--				{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
--				{ icon = " ", desc = "Files", group = "Label", action = "Telescope find_files", key = "f" },
--				{ desc = " Projects", group = "DiagnosticHint", action = "Telescope projects", key = "p" },
--			},
--			project = {
--				enable = true,
--				limit = 8,
--				icon = "",
--				label = "Recent Projects",
--				action = "Telescope find_files cwd=",
--			},
--			mru = {
--				enable = true,
--				limit = 10,
--				icon = "",
--				label = "Recent Files",
--			},
--			packages = { enable = true },
--		},
--	},
--}
--
return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
	opts = {
		theme = "hyper",
		config = {
			header = {
				"    ╔══════════════════════════════════╗",
				"    ║           SECURE ZONE            ║",
				"    ╠══════════════════════════════════╣",
				"    ║                                  ║",
				"    ║        ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄        ║",
				"    ║       ███████████████████        ║",
				"    ║      ██████████████████████      ║",
				"    ║     ████████████████████████     ║",
				"    ║    ██████████████████████████    ║",
				"    ║   ████████████████████████████   ║",
				"    ║  ██████████████████████████████  ║",
				"    ║ ████████████████████████████████ ║",
				"    ║ ████████████████████████████████ ║",
				"    ║ ████████████████████████████████ ║",
				"    ║ ████████████████████████████████ ║",
				"    ║  ██████████████████████████████  ║",
				"    ║   ████████████████████████████   ║",
				"    ║    ██████████████████████████    ║",
				"    ║     ████████████████████████     ║",
				"    ║      ██████████████████████      ║",
				"    ║       ███████████████████        ║",
				"    ║        ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀        ║",
				"    ║                                  ║",
				"    ╚══════════════════════════════════╝",
			},
			week_header = {
				enable = true,
			},
			shortcut = {
				{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
				{ desc = " Files", group = "Label", action = "Telescope find_files", key = "f" },
				{ desc = " Projects", group = "DiagnosticHint", action = "Telescope projects", key = "p" },
			},
			project = { enable = true, limit = 8, icon = "", label = "Recent Projects" },
			mru = { enable = true, limit = 10, icon = "", label = "Recent Files" },
		},
	},
}
