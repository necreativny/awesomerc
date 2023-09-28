local wibox = require('wibox')
local gears = require('gears')
local vicious = require('vicious')


local memval = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(memval, vicious.widgets.mem, "$2MiB/$3MiB")
local mem = wibox.widget {
	memval,
	max_value = 1,
	border_width = 5,
	border_color = '#aaff34',
	bg = '#234425',
	widget = wibox.container.arcchart
}
vicious.register(mem, vicious.widgets.mem, "$1")

local batval = wibox.widget.textbox()
vicious.cache(vicious.widgets.bat)
vicious.register(batval, vicious.widgets.bat, "$1\n$2\n$3")
local batbar = wibox.widget {
	batval,
	max_value = 1,
	forced_height = 20,
	forced_width  = 100,
	border_width = 5,
	border_color = '#aaff34',
	widget = wibox.container.arcchart
}
vicious.register(batbar, vicious.widgets.bat, "$2", 83, "BAT0")
local bat = wibox.widget {
	{
		batbar,
		direction = 'east',
		widget = wibox.container.rotate
	},
	batval,
	layout = wibox.layout.stack
}



local widget = wibox.widget{
	mem,
	batval,
	layout = wibox.layout.flex.horizontal
}

return widget
