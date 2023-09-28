local wibox = require('wibox')
local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')

local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/dashboard/power/'

local spacing = 10


local function make_power_button(name, command)
	local button = wibox.widget{
		image = icon_dir..name..'.svg',
		widget = wibox.widget.imagebox,
	}
	button.buttons = {
		awful.button({}, 1, function() awful.spawn(command, false) end)
	}
	return button
end


local power_buttons = wibox.widget{
	make_power_button('reboot', 'reboot'),
	make_power_button('shutdown', 'shutdown now'),
	make_power_button('lock', screen_lock),
	layout = wibox.layout.flex.vertical
}


image = wibox.widget.imagebox(beautiful.profile_image, true, gears.shape.circle)


function image:fit(context, width, height)
	res = height - beautiful.get_font_height() - spacing*3
	return res, res
end


local widget = wibox.widget{
	power_buttons,
	{
		{
			image,
			wibox.container.place(awful.widget.watch('uptime --pretty', 60)),
			spacing = spacing,
			layout = wibox.layout.fixed.vertical
		},
		halign = 'left',
		widget = wibox.container.place
	},
	layout = wibox.layout.align.horizontal
}

return widget
