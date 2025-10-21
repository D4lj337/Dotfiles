-- INFO: Mason
return {
	"mason/mason.nvim",
	event = { "BufRead", "BufNewFile" },
	cmd = "Mason",
	build = ":MasonUpdate",
	--	cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
	opts = {
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
		-- INFO: Formatter for various languges
		ensure_installed = {
			"prettier",
			"stylua",
			--			"black", -- python
			"shfmt",
			"ruff",
			"ast-grep", -- C,C++,Rust
		},
		automatic_installed = true,
	},
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")
		mr.refresh(function()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end)
	end,
}
