local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")



local dashboard = wibox({
	visible = false,
	ontop = true,
	screen = screen.primary,
	width = screen_width,
	height = screen_height - screen_height*beautiful.wibar_height,
	y = beautiful.wibar_position == 'top' and screen_height*beautiful.wibar_height,
})
awesome.connect_signal("dashboard::toggle",
	function()
		dashboard.visible = not dashboard.visible
		awesome.emit_signal('controls::update')
	end
)


local playerctl = require('widget.dashboard.playerctl')
-- function playerctl:fit(context, width, height)
-- 	return height, height
-- end

dashboard.widget = wibox.widget{
	{
		playerctl,
		require('widget.dashboard.monitor'),
		layout = wibox.layout.flex.horizontal
	},
	require('widget.dashboard.calendar'),
	{
		require('widget.dashboard.power'),
		require('widget.dashboard.controls'),
		require('widget.dashboard.calendar'),
		layout = wibox.layout.flex.horizontal
	},
	layout = wibox.layout.ratio.vertical
}

dashboard.widget:adjust_ratio(2, .3, .5, .2)



-- dashboard:setup {
-- 	widget = wibox.layout.align.vertical,
-- 	{
-- 		widget = wibox.layout.align.horisontal,
-- 		resurse_monitor,
-- 		manage_disks,
-- 		playerctl
-- 	},
-- 	nil,
-- 	{
-- 		widget = wibox.layout.align.horisontal,
-- 		power,
-- 		volume,
-- 		calendar
-- 	}
-- }

return dashboard
