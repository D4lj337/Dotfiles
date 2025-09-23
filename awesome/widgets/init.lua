local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local widgets = {}

-- CPU Widget
widgets.cpu = wibox.widget({
	{
		{
			id = "cpu_icon",
			text = "",
			font = "Font Awesome 5 Free 12",
			widget = wibox.widget.textbox,
		},
		{
			id = "cpu_text",
			text = "N/A",
			font = beautiful.font,
			widget = wibox.widget.textbox,
		},
		spacing = dpi(5),
		layout = wibox.layout.fixed.horizontal,
	},
	bg = beautiful.widget_bg,
	fg = beautiful.widget_fg,
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
})

awful.widget.watch('sh -c "top -bn1 | grep Cpu"', 2, function(widget, stdout)
	local cpu_usage = stdout:match("(%d+%.%d+)%%us")
	if cpu_usage then
		widget:get_children_by_id("cpu_text")[1].text = string.format("%.0f%%", cpu_usage)
	end
end, widgets.cpu)

-- Memory Widget
widgets.memory = wibox.widget({
	{
		{
			text = "",
			font = "Font Awesome 5 Free 12",
			widget = wibox.widget.textbox,
		},
		{
			id = "mem_text",
			text = "N/A",
			font = beautiful.font,
			widget = wibox.widget.textbox,
		},
		spacing = dpi(5),
		layout = wibox.layout.fixed.horizontal,
	},
	bg = beautiful.widget_bg,
	fg = beautiful.widget_fg,
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
})

awful.widget.watch('sh -c "free -m | grep Mem"', 5, function(widget, stdout)
	local used, total = stdout:match("Mem:%s+(%d+)%s+(%d+)")
	if used and total then
		local usage = math.floor((used / total) * 100)
		widget:get_children_by_id("mem_text")[1].text = string.format("%d%%", usage)
	end
end, widgets.memory)

-- Battery Widget
widgets.battery = wibox.widget({
	{
		{
			id = "bat_icon",
			text = "",
			font = "Font Awesome 5 Free 12",
			widget = wibox.widget.textbox,
		},
		{
			id = "bat_text",
			text = "N/A",
			font = beautiful.font,
			widget = wibox.widget.textbox,
		},
		spacing = dpi(5),
		layout = wibox.layout.fixed.horizontal,
	},
	bg = beautiful.widget_bg,
	fg = beautiful.widget_fg,
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
})

awful.widget.watch("acpi", 30, function(widget, stdout)
	local battery_info = stdout:match("Battery %d: (%w+), (%d+)%%")
	if battery_info then
		local status, charge = stdout:match("Battery %d: (%w+), (%d+)%%")
		local icon = ""
		if status == "Charging" then
			icon = ""
		elseif tonumber(charge) > 75 then
			icon = ""
		elseif tonumber(charge) > 50 then
			icon = ""
		elseif tonumber(charge) > 25 then
			icon = ""
		else
			icon = ""
		end
		widget:get_children_by_id("bat_icon")[1].text = icon
		widget:get_children_by_id("bat_text")[1].text = charge .. "%"
	end
end, widgets.battery)

-- Volume Widget with controls
widgets.volume = wibox.widget({
	{
		{
			id = "vol_icon",
			text = "",
			font = "Font Awesome 5 Free 12",
			widget = wibox.widget.textbox,
		},
		{
			id = "vol_text",
			text = "N/A",
			font = beautiful.font,
			widget = wibox.widget.textbox,
		},
		spacing = dpi(5),
		layout = wibox.layout.fixed.horizontal,
	},
	bg = beautiful.widget_bg,
	fg = beautiful.widget_fg,
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
})

function widgets.volume.update()
	awful.spawn.easy_async("pamixer --get-volume", function(stdout)
		local volume = tonumber(stdout)
		if volume then
			widgets.volume:get_children_by_id("vol_text")[1].text = volume .. "%"
			local icon = ""
			if volume > 50 then
				icon = ""
			elseif volume > 0 then
				icon = ""
			else
				icon = ""
			end
			widgets.volume:get_children_by_id("vol_icon")[1].text = icon
		end
	end)
end

function widgets.volume.inc()
	awful.spawn("pamixer -i 5")
	widgets.volume.update()
end

function widgets.volume.dec()
	awful.spawn("pamixer -d 5")
	widgets.volume.update()
end

function widgets.volume.toggle()
	awful.spawn("pamixer -t")
	widgets.volume.update()
end

widgets.volume.update()

-- Brightness Widget
widgets.brightness = wibox.widget({
	{
		{
			text = "",
			font = "Font Awesome 5 Free 12",
			widget = wibox.widget.textbox,
		},
		{
			id = "bright_text",
			text = "N/A",
			font = beautiful.font,
			widget = wibox.widget.textbox,
		},
		spacing = dpi(5),
		layout = wibox.layout.fixed.horizontal,
	},
	bg = beautiful.widget_bg,
	fg = beautiful.widget_fg,
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
})

function widgets.brightness.update()
	awful.spawn.easy_async("light -G", function(stdout)
		local brightness = math.floor(tonumber(stdout) or 0)
		widgets.brightness:get_children_by_id("bright_text")[1].text = brightness .. "%"
	end)
end

function widgets.brightness.inc()
	awful.spawn("light -A 10")
	widgets.brightness.update()
end

function widgets.brightness.dec()
	awful.spawn("light -U 10")
	widgets.brightness.update()
end

widgets.brightness.update()

-- Clock Widget
widgets.clock = wibox.widget({
	{
		{
			format = "%H:%M",
			font = beautiful.font,
			widget = wibox.widget.textclock,
		},
		{
			format = "%a %b %d",
			font = beautiful.font,
			widget = wibox.widget.textclock,
		},
		spacing = dpi(10),
		layout = wibox.layout.fixed.horizontal,
	},
	bg = beautiful.widget_bg,
	fg = beautiful.widget_fg,
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
})

return widgets
