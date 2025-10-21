-- Disable unused built-in features to improve performance and reduce memory
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"matchit",
	--	"netrw",
	"netrwFileHandlers",
	"loaded_remote_plugins",
	"loaded_tutor_mode_plugin",
	--	"netrwPlugin",
	"netrwSettings",
	"rrhelper",
	"spellfile_plugin",
	"tar",
	"tarPlugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"matchparen", -- matchparen.nvim disables the default
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

---- Set appropriate updatetime for better responsiveness (default 4000ms is often too slow).
vim.opt.updatetime = 250 -- faster completion and diagnostics

--Use efficient filetype detection and disable unnecessary patterns.
vim.g.do_filetype_lua = 1 -- use Lua for filetype detection

-- Parallel file processing
local function process_files_concurrent(files, processor, callback)
	local results = {}
	local completed = 0

	for i, file in ipairs(files) do
		vim.loop.fs_open(file, "r", 438, function(err, fd)
			if not err then
				vim.loop.fs_read(fd, 4096, 0, function(err2, data)
					vim.loop.fs_close(fd)
					if not err2 then
						results[i] = processor(data)
					end
					completed = completed + 1

					if completed == #files and callback then
						callback(results)
					end
				end)
			end
		end)
	end
end

-- Debounced operations
local debounce_timers = {}
local function debounce(key, fn, delay)
	if debounce_timers[key] then
		debounce_timers[key]:stop()
	end

	debounce_timers[key] = vim.defer_fn(function()
		fn()
		debounce_timers[key] = nil
	end, delay)
end

-- Configure diff algorithm for better performance
vim.opt.diffopt = {
	"internal", -- use internal diff algorithm
	"filler", -- show filler lines
	"closeoff", -- close diff when one window closes
	"hiddenoff", -- turn off diff when buffer becomes hidden
	"algorithm:patience", -- use patience algorithm for better diffs
}

-- Optimize for large diffs
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.wo.diff then
			-- Disable expensive features during diff
			vim.wo.cursorline = false
			vim.wo.relativenumber = false
			vim.opt_local.syntax = "off"
		end
	end,
})

-- Large file detection and optimization
local function optimize_for_large_file(bufnr)
	local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))

	if file_size > 1024 * 1024 then -- > 1MB
		-- Disable expensive features
		vim.bo[bufnr].syntax = "off"
		vim.bo[bufnr].filetype = ""
		vim.bo[bufnr].swapfile = false
		vim.bo[bufnr].undolevels = -1
		vim.wo.foldmethod = "manual"
		vim.wo.list = false

		-- Show warning
		vim.notify("Large file detected - some features disabled for performance")
	end
end

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		optimize_for_large_file(args.buf)
	end,
})

-- Conditional loading based on file size
local function should_load_heavy_plugins()
	local file_size = vim.fn.getfsize(vim.fn.expand("%"))
	return file_size < 1024 * 1024 -- Load only for files < 1MB
end

-- Disable syntax for large files
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local file_size = vim.fn.getfsize(vim.fn.expand("%"))
		if file_size > 1024 * 1024 then -- 1MB
			vim.opt_local.syntax = "off"
			vim.opt_local.filetype = ""
			vim.opt_local.undolevels = -1
		end
	end,
})

-- Optimize file reading
vim.opt.fsync = false -- disable fsync for faster writes

-- Async file operations
local function async_read_file(path, callback)
	vim.loop.fs_open(path, "r", 438, function(err, fd)
		if not err then
			vim.loop.fs_fstat(fd, function(err2, stat)
				if not err2 then
					vim.loop.fs_read(fd, stat.size, 0, function(err3, data)
						vim.loop.fs_close(fd)
						if callback then
							callback(err3, data)
						end
					end)
				end
			end)
		end
	end)
end

-- Group related autocommands for better performance
local group = vim.api.nvim_create_augroup("PerformanceOptimization", { clear = true })

-- Use specific patterns instead of wildcards
vim.api.nvim_create_autocmd("BufReadPost", {
	group = group,
	pattern = { "*.py", "*.js", "*.lua" }, -- specific patterns
	callback = function()
		-- optimized callback
	end,
})

-- Debounce frequent events
local timer = nil
vim.api.nvim_create_autocmd("CursorMoved", {
	group = group,
	callback = function()
		if timer then
			timer:stop()
		end
		timer = vim.loop.new_timer()
		timer:start(
			100,
			0,
			vim.schedule_wrap(function()
				-- debounced action
			end)
		)
	end,
})

-- Terminal-specific optimizations
if os.getenv("TERM") == "xterm-256color" then
	vim.opt.ttyfast = true
end

---- Reduce redraw frequency
--vim.opt.scrolljump = 8 -- scroll 8 lines at a time
--vim.opt.sidescroll = 15 -- horizontal scroll 15 chars
vim.opt.sidescrolloff = 5 -- horizontal scroll offset
--
---- Optimize cursor movement
vim.opt.cursorline = false -- disable cursor line highlighting
vim.opt.cursorcolumn = false -- disable cursor column

-- Optimize sign column
vim.opt.signcolumn = "yes:1" -- always show 1 sign column
