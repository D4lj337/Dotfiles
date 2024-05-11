return {
 
  -- Catppucin 
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
 
  -- Telescope 
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }},
 
  -- Treesitter
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  
  -- Neo tree
  { 
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    -- Lua line (modeline)
    {'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }},

    -- Dashboard
    { 'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
}
}
