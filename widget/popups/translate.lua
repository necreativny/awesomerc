-- return require('widget.dashboard.calendar')





local wibox = require('wibox')
local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')

local icon_dir = awful.util.get_configuration_dir()..
'/themes/default/widget/popups/translate/'



local function make_button(name, func)
	local button = wibox.widget{
		image = icon_dir..name..'.svg',
		forced_height = beautiful.get_font_height()*beautiful.button_height_k,
		widget = wibox.widget.imagebox,
	}
	button.buttons = {
		awful.button({}, 1, func)
	}
	return button
end


local translation = wibox.widget{
	markup = "This <i>is</i> a <b>textbox</b>!!!",
	align = "center",
	valign = "center",
	widget = wibox.widget.textbox
}

local separator = wibox.widget{
	image = icon_dir..'separator.svg',
	forced_height = beautiful.get_font_height()*beautiful.button_height_k,
	widget = wibox.widget.imagebox,
}

local source_lang = wibox.widget{
	markup = 'sc',
	align = 'center',
	valign = 'center',
	widget = wibox.widget.textbox
}
local trans_lang = wibox.widget{
	{
		{
			markup = 'tr',
			align = 'center',
			valign = 'center',
			widget = wibox.widget.textbox
		},
		{
			image = icon_dir..'dropdown.svg',
			forced_height = beautiful.get_font_height(),
			widget = wibox.widget.imagebox
		},
		layout = wibox.layout.fixed.horizontal
	},
	buttons = {
		awful.button({}, 1, function() end)
	},
	widget = wibox.widget.background
}

awesome.emit_signal('translate::', function(text)
	translation:set_markup_silently(text)
end)




local widget = wibox.widget{
	{
		translation,
		{
			{
				source_lang,
				{
					make_button('speak', function() awesome.emit_signal('translate::speak_source') end),
					make_button('copy', function() awesome.emit_signal('translate::copy_source') end),
					layout = wibox.layout.flex.horizontal
				},
				nil,
				expand = 'none',
				layout = wibox.layout.align.horizontal
			},
			separator,
			{
				nil,
				{
					make_button('copy', function() awesome.emit_signal('translate::copy_trans') end),
					make_button('speak', function() awesome.emit_signal('translate::speak_trans') end),
					layout = wibox.layout.flex.horizontal
				},
				trans_lang,
				expand = 'none',
				layout = wibox.layout.align.horizontal
			},
			expand = 'outside',
			layout = wibox.layout.align.horizontal
		},
		layout = wibox.layout.fixed.vertical
	},
	bg = '#fc5739',
	forced_width = 600,
	widget = wibox.container.background
}
return widget
