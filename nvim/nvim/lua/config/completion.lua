-- Enable popup menu for command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum"  -- Use popup menu instead of horizontal list

-- Auto-trigger completion as you type
vim.api.nvim_create_autocmd("CmdlineChanged", {
  pattern = "[:\\/?]",
  callback = function()
    vim.fn.wildtrigger()
  end,
})

