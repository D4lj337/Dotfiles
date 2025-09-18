--require("catppuccin").setup {
--    color_overrides = {
--        all = {
--            text = "#ffffff",
--        },
--        latte = {
--            base = "#ff0000",
--            mantle = "#242424",
--            crust = "#474747",
--        },
--        frappe = {},
--        macchiato = {},
--        mocha = {
--					base = "#000000",
--					mantle = "#000000",
--					crust = "#000000",
--    }
--},
--
--    integrations = {
--				telescope = {
--					enabled = true,
--					style = "nvchad",
--
--    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--        comments = { "italic" }, -- Change the style of comments
--        conditionals = { "italic" },
--        loops = {},
--        functions = {},
--        keywords = {},
--        strings = {},
--        variables = {},
--        numbers = {},
--        booleans = {},
--        properties = {},
--        types = {},
--        operators = {},
--        -- miscs = {}, -- Uncomment to turn off hard-coded styles
--    },
--},}}

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
--    priority = 1000,
    opts = {
      transparent_background = false, -- disables setting the background color.
      float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
      },
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "italic" },
        keywords = { "italic" },
        strings = { "italic" },
        variables = { "italic" },
        numbers = { "italic" },
        booleans = { "italic" },
        properties = { "italic" },
        types = { "italic" },
        operators = { "italic" },
        miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {
        all = {
          text = "#ffffff",
        },
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      custom_highlights = {},
      default_integrations = true,
      auto_integrations = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
  }
}

				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
