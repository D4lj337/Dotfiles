-- INFO: Enabling the lsp servers for various programming languges
vim.lsp.enable({ "Lua_ls", "pyright", "clangd", "bashls", "pylsp" })

-- INFO: Disable logging
vim.lsp.log.set_level(vim.log.levels.OFF)

-- INFO: attaching to lsp server
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/implementation") then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end

		-- Lsp capabilities with Blink
		if vim.fn.has("nvim-0.11") == 1 and vim.lsp.config then
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})
		end

		-- INFO: Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		--		if client:supports_method("textDocument/completion") then
		--			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
		--			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
		--			-- client.server_capabilities.completionProvider.triggerCharacters = chars
		--
		--			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		--		end
		--
		--		-- INFO: Auto-format ("lint") on save.
		--		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		--		if
		--			not client:supports_method("textDocument/willSaveWaitUntil")
		--			and client:supports_method("textDocument/formatting")
		--		then
		--			vim.api.nvim_create_autocmd("BufWritePre", {
		--				group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
		--				buffer = args.buf,
		--				callback = function()
		--					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
		--				end,
		--			})
		--		end
	end,
})

---- INFO: To automatically fold imports when opening a file, you can use an autocmd: >lua
vim.api.nvim_create_autocmd("LspNotify", {
	callback = function(args)
		if args.data.method == "textDocument/didOpen" then
			vim.lsp.foldclose("imports", vim.fn.bufwinid(args.buf))
		end
	end,
})

---- INFO: Enable diagnostics display (run as a function)
vim.diagnostic.enable = true

-- INFO: Lsp diagnostics indicator
vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	--	float = {
	--		border = "rounded",
	--		source = true,
	--	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "┃", --- Red

			[vim.diagnostic.severity.WARN] = "┃", --- Organge

			[vim.diagnostic.severity.HINT] = "┃", --- Blue

			[vim.diagnostic.severity.INFO] = "┃", --- Green
		},
	},
})

vim.cmd([[
   highlight DiagnosticSignError guifg=#FF0000 guibg=NONE gui=bold
   highlight DiagnosticSignWarn guifg=#FFAA00 guibg=NONE gui=bold
   highlight DiagnosticSignHint guifg=#0099FF guibg=NONE gui=bold
   highlight DiagnosticSignInfo guifg=#00CC55 guibg=NONE gui=bold
]])

--vim.diagnostic.config({
--	signs = {
--		text = {
--			[vim.diagnostic.severity.ERROR] = "", -- or other icon of your choice here, this is just what my config has:
--			[vim.diagnostic.severity.WARN] = "",
--			[vim.diagnostic.severity.INFO] = "",
--			[vim.diagnostic.severity.HINT] = "󰌵",
--		},
--	},
--})
-----------------
--- languges ----
-----------------

-- INFO: (Re-)define the "clangd" configuration (overrides the resolved chain): >lua
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--offset-encoding=utf-8",
	},
	root_markers = { ".clangd", "compile_commands.json" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	settings = {
		clangd = {
			checkUpdates = false,
			detectExtensionConflicts = true,
			enableCodeCompletion = true,
			onConfigChanged = "restart",
			path = "/usr/bin/clangd",
			restartAfterCrash = true,
			serverCompletionRanking = false,
		},
	},
	root_dir = function(bufnr, on_dir)
		if not vim.fn.bufname(bufnr):match("%.txt$") then
			on_dir(vim.fn.getcwd())
		end
	end,
})

-- INFO: Lua_ls
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	--    filetypes = { "lua" },
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			runtime = { version = "LuaJIT" },
		},
	},
})

-- Prevent LSP fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- or the newer version:
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
