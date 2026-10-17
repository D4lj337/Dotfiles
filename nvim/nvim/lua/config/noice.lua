-- lua/noice-setup.lua
vim.opt.termguicolors = true

-- Make sure noice is installed/available (via vim-pack in init.lua)
pcall(function()
  require("noice").setup({
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
      hover = { enabled = true },
      signature = { enabled = true },
      progress = { enabled = true },
    },
    messages = { enabled = true },
    notify = { enabled = true },
  })
end)

