local wibox = require('wibox')
local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')

local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/wibar/'





local menu_button = wibox.widget{
	image = gears.color.recolor_image(icon_dir..'rocket.svg', beautiful.color1),
	widget = wibox.widget.imagebox,
}
menu_button:buttons(
	gears.table.join(
		awful.button(
			{}, 1,
			function()
				awful.spawn.with_shell(menu)
			end
		)
	)
)

return menu_button
