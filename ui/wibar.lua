local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local theme = require('ui.themes.theme')


screen.connect_signal("request::desktop_decoration", function(s)
	local wibar = awful.wibar({
		position = 'right',
		screen = s,
		width = theme.em_scale*theme.wibar_width,
		--bg = beautiful.bg_normal .. "0",
	})
	wibar:setup{
		wibox.widget{
			bg = '#aa2282',
			-- forced_height = 100,
			widget = wibox.container.background
		},
		wibox.widget{
			bg = '#ff2282',
			-- forced_height = 100,
			widget = wibox.container.background
		},
		layout = wibox.layout.flex.horizontal
	}
end)