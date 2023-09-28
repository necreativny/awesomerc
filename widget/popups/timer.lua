local wibox = require('wibox')



local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/popups/'


local widgets = {}
-- widgets.calendar = require('widget.dashboard.calendar')
widgets.timer = wibox.widget{
	bg = '#aa2282',
	forced_height = 100,
	widget = wibox.container.background
}
widgets.calendar = wibox.widget{
	bg = '#fc890a',
	forced_height = 100,
	widget = wibox.container.background
}









-- local time
-- local buttons


-- local timer = wibox.widget{
-- 	time,
-- 	buttons,
-- 	layout = wibox.layout..horizontal
-- }





local active_widget = wibox.container.background()

active_widget:connect_signal('set_widget',
	function(_, tab)
		active_widget:set_widget(widgets[tab])
	end
)

local function gen_tab(name)
	return wibox.widget{
		image = icon_dir..name..'.svg',
		buttons = {awful.button({}, 1, function()
			active_widget:emit_signal('set_widget', name) end
		)},
		widget = wibox.widget.imagebox,
	}
end
local tabs = {
	gen_tab('calendar'),
	gen_tab('timer'),
	layout = wibox.layout.flex.horizontal
}


return wibox.widget{
		{
			active_widget,
			tabs,
			layout = wibox.layout.align.vertical
		},
		bg = '#493938',
		widget = wibox.container.background
}
