local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")

local themes_path = gears.filesystem.get_themes_dir()
local theme = {}

-- Colors (Nord-inspired)
theme.bg_normal = "#2E3440"
theme.bg_focus = "#3B4252"
theme.bg_urgent = "#BF616A"
theme.bg_minimize = "#434C5E"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#D8DEE9"
theme.fg_focus = "#ECEFF4"
theme.fg_urgent = "#88C0D0"
theme.fg_minimize = "#5E81AC"

-- Borders
theme.useless_gap = dpi(2)
theme.border_width = dpi(2)
theme.border_normal = "#434C5E"
theme.border_focus = "#88C0D0"
theme.border_marked = "#A3BE8C"

-- Font
theme.font = "FiraCode Nerd Font 10"

-- Wallpaper
theme.wallpaper = "~/.config/awesome/wallpaper.jpg"

-- Widget colors
theme.widget_bg = "#3B4252"
theme.widget_fg = "#D8DEE9"

-- Taglist
theme.taglist_bg_focus = "#5E81AC"
theme.taglist_fg_focus = "#ECEFF4"

-- Tasklist
theme.tasklist_bg_focus = "#434C5E"
theme.tasklist_fg_focus = "#ECEFF4"

-- Wibar
theme.wibar_bg = "#2E3440"
theme.wibar_fg = "#D8DEE9"

-- Generate Awesome icon
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons
theme.icon_theme = nil

return theme
