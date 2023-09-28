local wibox = require('wibox')
local awful = require('awful')



local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/wibar/'


local menu_button = wibox.widget{
	image = icon_dir..'archlinux_logo.png',
	buttons = {awful.button({}, 1, function() awesome.emit_signal('dashboard::toggle') end)},
	widget = wibox.widget.imagebox,
}




return menu_button
