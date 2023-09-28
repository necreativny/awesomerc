local wibox = require('wibox')
local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')

local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/wibar/volume/'


local volume = wibox.widget{
	image = gears.color.recolor_image(icon_dir..'volume.svg', beautiful.color2),
	widget = wibox.widget.imagebox,
}
volume:buttons(
	gears.table.join(
		awful.button(
			{}, 2, function()
				awesome.emit_signal('volume::toogle')
			end
		),
		awful.button(
			{}, 3, function()
				awful.spawn.with_shell(volume_control)
			end
		),
		awful.button(
			{}, 4, function()
				awesome.emit_signal('volume::change', 'up')
			end
		),
		awful.button(
			{}, 5, function()
				awesome.emit_signal('volume::change', 'down')
			end
		)
	)
)

return volume
