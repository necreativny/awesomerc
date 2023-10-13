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
		background({
			widget = wibox.widget{
				background({
					widget = wibox.widget{
						bg = '#aa228277',
						forced_height = 100,
						widget = wibox.container.background
					},
				}),
				background({
					widget = wibox.widget{
						bg = '#aa228277',
						widget = wibox.container.background
					},
				}),
				background({
					widget = wibox.widget{
						bg = '#aa228277',
						forced_height = 200,
						widget = wibox.container.background
					},
				}),
				expand = none,
				layout = wibox.layout.align.vertical
			},
			opacity_hex = '00',
			border_width = 0,
			margin = {
				left = -beautiful.background.margin,
				right = beautiful.background.margin,
				top = beautiful.background.margin,
				bottom = beautiful.background.margin,
			},
		}),
		--without any layout - "base.lua:745 index nil value 'layout'"
		layout = wibox.layout.flex.vertical
	}
end)