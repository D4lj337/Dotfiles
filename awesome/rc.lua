-- awesome configuration file
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local lain = require("lain")
local freedesktop = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local dpi = require("beautiful.xresources").apply_dpi

-- Error handling
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Startup errors!",
        text = awesome.startup_errors
    })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Error!",
            text = tostring(err)
        })
        in_error = false
    end)
end

-- Variable definitions
local modkey = "Mod4"
local altkey = "Mod1"
local terminal = "alacritty"
local editor = os.getenv("EDITOR") or "nvim"
local browser = "firefox"

-- Theme
local theme_path = string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME"))
beautiful.init(theme_path)

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    lain.layout.cascade,
    lain.layout.cascade.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
}

-- Wallpaper
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

screen.connect_signal("property::geometry", set_wallpaper)

-- Scratchpad setup
local scratchpad = {}

function scratchpad.toggle()
    local matcher = function (c)
        return awful.rules.match(c, {class = "scratchpad"})
    end
    
    local clients = awful.client.iterate(matcher)
    local client = clients()
    
    if client then
        if client.minimized or not client:isvisible() then
            client.minimized = false
            client:move_to_screen()
            client:raise()
            awful.client.focus.byidx(0, client)
        else
            client.minimized = true
        end
    else
        awful.spawn(terminal .. " --class scratchpad", {
            floating = true,
            tag = mouse.screen.selected_tag,
            placement = awful.placement.centered,
        })
    end
end

-- Widget definitions
local widgets = require("widgets")

-- Tags setup
awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
    
    -- Tag names and layouts
    local names = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}
    local l = awful.layout.suit
    local layouts = {l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.floating}
    
    awful.tag(names, s, layouts)
    
    -- Create promptbox
    s.mypromptbox = awful.widget.prompt()
    
    -- Create layoutbox
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function () awful.layout.inc(1) end),
        awful.button({}, 3, function () awful.layout.inc(-1) end),
        awful.button({}, 4, function () awful.layout.inc(1) end),
        awful.button({}, 5, function () awful.layout.inc(-1) end)
    ))
    
    -- Create taglist
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = gears.table.join(
            awful.button({}, 1, function(t) t:view_only() end),
            awful.button({modkey}, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({modkey}, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end)
        )
    }
    
    -- Create tasklist
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = gears.table.join(
            awful.button({}, 1, function (c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal("request::activate", "tasklist", {raise = true})
                end
            end)
        )
    }
    
    -- Create wibox
    s.mywibox = awful.wibar({position = "top", screen = s, height = dpi(24)})
    
    -- Add widgets to wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            widgets.cpu,
            widgets.memory,
            widgets.battery,
            widgets.volume,
            widgets.brightness,
            wibox.widget.systray(),
            widgets.clock,
            s.mylayoutbox,
        },
    }
end)

-- Key bindings
globalkeys = gears.table.join(
    -- Awesome controls
    awful.key({modkey, "Control"}, "r", awesome.restart),
    awful.key({modkey, "Shift"}, "q", awesome.quit),
    
    -- Applications
    awful.key({modkey}, "Return", function() awful.spawn(terminal) end),
    awful.key({modkey}, "w", function() awful.spawn(browser) end),
    awful.key({modkey}, "r", function() awful.screen.focused().mypromptbox:run() end),
    
    -- Scratchpad
    awful.key({modkey}, "grave", scratchpad.toggle),
    
    -- Rofi launcher
    awful.key({modkey}, "d", function() awful.spawn("rofi -show drun") end),
    
    -- Layout manipulation
    awful.key({modkey}, "j", function() awful.client.focus.byidx(1) end),
    awful.key({modkey}, "k", function() awful.client.focus.byidx(-1) end),
    awful.key({modkey, "Shift"}, "j", function() awful.client.swap.byidx(1) end),
    awful.key({modkey, "Shift"}, "k", function() awful.client.swap.byidx(-1) end),
    
    -- Master/stack manipulation
    awful.key({modkey}, "l", function() awful.tag.incmwfact(0.05) end),
    awful.key({modkey}, "h", function() awful.tag.incmwfact(-0.05) end),
    awful.key({modkey, "Shift"}, "h", function() awful.tag.incnmaster(1, nil, true) end),
    awful.key({modkey, "Shift"}, "l", function() awful.tag.incnmaster(-1, nil, true) end),
    
    -- Layout switching
    awful.key({modkey}, "space", function() awful.layout.inc(1) end),
    awful.key({modkey, "Shift"}, "space", function() awful.layout.inc(-1) end),
    
    -- Media keys
    awful.key({}, "XF86AudioRaiseVolume", widgets.volume.inc),
    awful.key({}, "XF86AudioLowerVolume", widgets.volume.dec),
    awful.key({}, "XF86AudioMute", widgets.volume.toggle),
    awful.key({}, "XF86MonBrightnessUp", widgets.brightness.inc),
    awful.key({}, "XF86MonBrightnessDown", widgets.brightness.dec)
)

-- Client keys
clientkeys = gears.table.join(
    awful.key({modkey}, "f", function(c) c.fullscreen = not c.fullscreen; c:raise() end),
    awful.key({modkey, "Shift"}, "c", function(c) c:kill() end),
    awful.key({modkey, "Control"}, "space", awful.client.floating.toggle),
    awful.key({modkey, "Control"}, "Return", function(c) c:swap(awful.client.getmaster()) end),
    awful.key({modkey}, "o", function(c) c:move_to_screen() end),
    awful.key({modkey}, "t", function(c) c.ontop = not c.ontop end),
    awful.key({modkey}, "n", function(c) c.minimized = true end),
    awful.key({modkey}, "m", function(c)
        c.maximized = not c.maximized
        c:raise()
    end)
)

-- Tag keys
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        awful.key({modkey}, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then tag:view_only() end
        end),
        awful.key({modkey, "Control"}, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then awful.tag.viewtoggle(tag) end
        end),
        awful.key({modkey, "Shift"}, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then client.focus:move_to_tag(tag) end
            end
        end)
    )
end

root.keys(globalkeys)

-- Rules
awful.rules.rules = {
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },
    {
        rule = {class = "scratchpad"},
        properties = {
            floating = true,
            width = 800,
            height = 600,
            x = 200,
            y = 100,
            sticky = true,
            ontop = true,
            skip_taskbar = true,
        }
    },
}

-- Signals
client.connect_signal("manage", function (c)
    if awesome.startup and not c.size_hints.user_position
       and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Autostart applications
awful.spawn.with_shell("picom --config ~/.config/picom/picom.conf")
awful.spawn.with_shell("nitrogen --restore")
