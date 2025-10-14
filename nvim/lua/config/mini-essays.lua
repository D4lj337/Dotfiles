-- mini_essays.lua: Neovim plugin for enforcing a mini-essay environment in org files

local M = {}

-- Configurable settings
M.max_chars = 4000
M.fill_column = 72
M.file_pattern = "^mini.*%.org$"

-- Utility: Match buffer filename to pattern
local function is_mini_org_file()
  local name = vim.api.nvim_buf_get_name(0)
  return name:match(M.file_pattern) ~= nil
end

-- Character limit enforcement for insert and normal mode
local function enforce_char_limit()
  if not is_mini_org_file() then return end
  local bufnr = 0
  local size = vim.api.nvim_buf_get_offset(bufnr, vim.api.nvim_buf_line_count(bufnr))
  if size > M.max_chars then
    vim.api.nvim_command('undo')
    vim.notify('Limit ' .. M.max_chars .. ' chars reached', vim.log.levels.WARN)
  end
end

-- Pasting (yank) guard: trims pasted text.
local function trim_excess_chars()
  if not is_mini_org_file() then return end
  local bufnr = 0
  local size = vim.api.nvim_buf_get_offset(bufnr, vim.api.nvim_buf_line_count(bufnr))
  if size > M.max_chars then
    local excess = size - M.max_chars
    local curpos = vim.api.nvim_win_get_cursor(0)
    -- Delete excess chars from the end of buffer
    vim.api.nvim_buf_set_text(bufnr, curpos[1]-1, curpos[2]-excess, curpos[1]-1, curpos[2], {""})
    vim.notify('Trimmed yank to ' .. M.max_chars .. ' chars', vim.log.levels.WARN)
  end
end

-- Insert header skeleton if this is a new mini org file
local function insert_header_skeleton()
  if is_mini_org_file() and vim.api.nvim_buf_line_count(0) == 1 then
    local title = vim.fn.expand('%:t:r')
    local author = os.getenv("USER") or ""
    local date = os.date("%Y-%m-%d")
    local header = {
      "#+title: " .. title,
      "#+author: " .. author,
      "#+date: " .. date,
      "#+options: toc:nil num:nil",
      "#+property: reference:",
      "",
      "* Draft",
      ""
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, header)
    vim.api.nvim_win_set_cursor(0, {#header, 0})
  end
end

-- Fill-column indicator setup (requires nvim-cursorline or compatible plugin)
local function set_fill_column()
  vim.opt.textwidth = M.fill_column
  vim.opt.colorcolumn = tostring(M.fill_column)
  vim.cmd("set formatoptions+=t") -- Auto-wrap
end

-- Main Autocmds
function M.setup()
  vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    pattern = "*mini*.org",
    callback = function()
      insert_header_skeleton()
      set_fill_column()
    end
  })

  vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
    pattern = "*mini*.org",
    callback = enforce_char_limit
  })

  vim.api.nvim_create_autocmd({"TextYankPost"}, {
    pattern = "*mini*.org",
    callback = trim_excess_chars
  })
end

return M
