local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')


local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/wibar/'

local timer_button = wibox.widget{
	image = gears.color.recolor_image(icon_dir..'timer.svg', beautiful.color4),
	buttons = {awful.button({}, 1, function() awesome.emit_signal('timer::toggle') end)},
	widget = wibox.widget.imagebox,
}


return timer_button
