return {
	"nvim-neorg/neorg",
	lazy = true,
	version = "*",
	config= true,
	opts = {
          load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
              config = {
                workspaces = {
 --                 notes = "~/notes",
                },
  --              default_workspace = "notes",
              },
            },
          },
  },
  }
