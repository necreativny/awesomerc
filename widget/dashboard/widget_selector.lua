local wibox = require('wibox')
local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')



local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/dashboard/widget_selector/'


local function make_selector(name)
	local button = wibox.widget{
		image = icon_dir..name..'.svg',
		widget = wibox.widget.imagebox,
	}
	button.buttons = {
		awful.button({}, 1, function() awesome.emit_signal('widget_selector::'..name) end)
	}
	return button
end

local widget = wibox.widget{
	make_selector('shazam'),
	make_selector('screenshot'),
	make_selector('record'),
	make_selector('update'),-- checkupdates
	layout = wibox.layout.flex.horizontal
}

return widget
