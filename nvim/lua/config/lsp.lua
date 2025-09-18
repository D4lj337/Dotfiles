local lspconfig = require("lspconfig")

-- Setup Lua language server
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				--        library = vim.api.nvim_get_runtime_file("", true), -- slow down lua_ls
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Setup other language servers similarly:
lspconfig.clangd.setup({})
--lspconfig.bashls.setup {}
lspconfig.asm_lsp.setup({})

--INFO: Bash
require("lspconfig").bashls.setup({
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	root_dir = function(fname)
		return vim.fn.getcwd()
	end,
})

--INFO: ASM
require("lspconfig").asm_lsp.setup({
	cmd = { "asm-lsp" },
	filetypes = { "asm", "nasm" },
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern(".git")(fname) or vim.loop.cwd()
	end,
	settings = {
		assembler = "yasm",
	},
})

--INFO: Enable diagnostics display (run as a function)
vim.diagnostic.enable = true

-- Configure diagnostic signs
--vim.diagnostic.config({
--  signs = {
--    active = true,
--    severity_sort = true,
--    update_in_insert = false,
--    underline = true,
--  },
--  virtual_text = false,
--  signs = {
--    severity = {
--      min = vim.diagnostic.severity.ERROR,
--      max = vim.diagnostic.severity.ERROR,
--    },
--    text = {
--      [vim.diagnostic.severity.ERROR] = '┃',    -- Red
--      [vim.diagnostic.severity.WARN] = '┃',     -- Orange
--      [vim.diagnostic.severity.HINT] = '┃',     -- Blue
--      [vim.diagnostic.severity.INFO] = '┃',     -- Green
--    },
--  },
--})

vim.cmd([[
  highlight DiagnosticSignError guifg=#FF0000 guibg=NONE gui=bold
  highlight DiagnosticSignWarn guifg=#FFAA00 guibg=NONE gui=bold
  highlight DiagnosticSignHint guifg=#0099FF guibg=NONE gui=bold
  highlight DiagnosticSignInfo guifg=#00CC55 guibg=NONE gui=bold
]])

--vim.lsp.enable({ "lua_ls", "clang", "bash-language-server", "asm-lsp" })
--vim.lsp.config("lua_ls", {
--	settings = {
--		Lua = {
--                diagnostics = {
--                    globals = { 'vim' },
--                },
--                runtime = {
--                    version = 'LuaJIT',
--                },
--			workspace = {
----				library = --vim.api.nvim_get_runtime_file("", true), -- slow down lua_ls
--			},
--            telemetry = {
--                enable = false,
--           },
--		},
--	},
--})
--
---- Lsp diagnostics
--vim.diagnostic.enable = true

-- Lsp diagnostics indicator
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "┃", -- Red
			[vim.diagnostic.severity.WARN] = "┃", -- Organge
			[vim.diagnostic.severity.HINT] = "┃", -- Blue
			[vim.diagnostic.severity.INFO] = "┃", -- Green
		},
	},
})
--
--vim.cmd [[
--  highlight DiagnosticSignError guifg=#FF0000 guibg=NONE gui=bold     " Bright red, darker
--  highlight DiagnosticSignWarn guifg=#FFAA00 guibg=NONE gui=bold      " Bright orange, darker
--  highlight DiagnosticSignHint guifg=#0099FF guibg=NONE gui=bold      " Bright blue, darker
--  highlight DiagnosticSignInfo guifg=#00CC55 guibg=NONE gui=bold      " Bright green, darker
--]]
--
--
--

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
