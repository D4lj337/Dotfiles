local LspServers = {}

--local nproc = tonumber(vim.fn.system({"nproc"}))

local cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=iwyu",
    -- "--clang-tidy",
}

--if nproc and nproc > 0 then
--    table.insert(cmd, "--j=" .. (nproc - 1))
--end
--
LspServers["clangd"] = { cmd = cmd }
vim.lsp.enable(cmd)
