local wibox = require('wibox')
local beautiful = require('beautiful')

local function make_button(args)
	--value or table with cycle/toggle parameter forms
	local text = args.text
	local icon = args.icon
	local bg = args.bg or beautiful.button.bg
	-----------
	local text_size = args.font or beautiful.font
	local border = args.border or beautiful.button.border_color
	local border_width = args.border_width or beautiful.button.border_width
	local margin = (args.margin or 1) * beautiful.margin
	--functions to modify bg & border color on hover/press
	local on_hover = args.on_hover or beautiful.button.on_hover or function(bg, border) return bg, border end
	local on_press = args.on_press or beautiful.button.on_press or function(bg, border) return bg, border end
	--callbacks for click and each mouse button
	local onclick_act = args.onclick_act or function() end
	local on_2 = args.on_2 or function() end
	local on_3 = args.on_3 or function() end
	local on_4 = args.on_4 or function() end
	local on_5 = args.on_5 or function() end
	
	local button = wibox.widget{
		{
			{
				{
					image = icon,
					widget = wibox.container.imagebox,
				},
				{
					text = text,
					widget = wibox.container.textbox,
				},
				layout = wibox.layout.fixed.horizontal
			},
			margins = margin,
			widget = wibox.container.margin,
		},
		bg = bg,
		border_color = border,
		border_width = border_width,
		widget = wibox.container.background
	}
	button.buttons = {
		awful.button({}, 2, on_2),
		awful.button({}, 3, on_3),
		awful.button({}, 4, on_4),
		awful.button({}, 5, on_5),
	}
end


-- 	return wibox.widget{
-- 		background(border)
-- 			margin
-- 				icon, text
-- 	}
-- local menu_button = wibox.widget{
-- 	image = icon_dir..'archlinux_logo.png',
-- 	buttons = {awful.button({}, 1, function() awesome.emit_signal('dashboard::toggle') end)},
-- 	widget = wibox.widget.imagebox,
-- }



return make_button
