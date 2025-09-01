require("mason-lspconfig").setup({
  ensure_installed = {
 --   "lua-languge-server",
    "clangd", -- make sure unzip packge is installed.
    "pylsp",
    "textlsp",
--    "clang-format",
    "pylsp",
--    "rust_analyzer",
  },
})
