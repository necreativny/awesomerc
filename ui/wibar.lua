local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local background = require('ui.widget.background')


screen.connect_signal("request::desktop_decoration", function(s)
	local wibar = awful.wibar({
		position = 'right',
		screen = s,
		width = beautiful.em_scale*beautiful.wibar_width,
	})
	wibar:setup{
		wibox.widget{
			bg = '#aa228277',
			-- forced_height = 100,
			widget = wibox.container.background
		},
		background({
			widget = wibox.widget{
				bg = '#aa228277',
				widget = wibox.container.background
			},
			bg = '#aa2282',
		}),
		wibox.widget{
			border_color = '#ffff11',
			border_width = 0.1*beautiful.em_scale,
			widget = wibox.container.background
		},
		layout = wibox.layout.flex.vertical
	}
end)