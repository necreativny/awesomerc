local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')



local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/dashboard/controls/'


local function make_slider_icon(name)
	local button = wibox.widget{
		image = icon_dir..name..'.svg',
		widget = wibox.widget.imagebox,
	}
	button.buttons = {
		awful.button({}, 1, function() awesome.emit_signal(name..'::toogle') end)
	}
	return button
end
local function make_slider(name, scroll_step)
	local widget = wibox.widget {
		bar_shape = gears.shape.rounded_rect,
		handle_width = 1,
		maximum = 100,
		handle_color = '#FFA9A9',
		handle_border_color = '#FFA9A9',
		handle_shape = gears.shape.rounded_rect,
		bar_active_color = '#FFA9A9',
		bar_color = '#C884B2',
		widget = wibox.widget.slider,
	}
	widget.buttons = {
		awful.button({}, 4, function() widget.value = widget.value+scroll_step end),
		awful.button({}, 5, function() widget.value = widget.value-scroll_step end)
	}
	widget:connect_signal("property::value",
		function(_, val)
			awesome.emit_signal(name..'::set', val)
		end
	)
	awesome.connect_signal(name..'::val:post', function(val) widget.value = val end)
	return widget
end
local function make_controller(name, scroll_step)
	return wibox.widget{
		make_slider_icon(name),
		make_slider(name, scroll_step),
		layout = wibox.layout.fixed.horizontal
	}
end


awesome.connect_signal('controls::update', function(vars)
	if vars == nil then
		vars = {'volume', 'micro', 'brightness'}
	end
	for _, var in ipairs(vars) do
		awesome.emit_signal(var..'::val:request')
	end
end)

return wibox.widget{
	{
		make_controller('volume', 3),
		make_controller('micro', 3),
		make_controller('brightness', 3),
		layout = wibox.layout.flex.vertical
	},
	widget = wibox.container.margin
}
