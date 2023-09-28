local menubar = require("menubar")
local awful = require('awful')
local beautiful = require('beautiful')
local hotkeys_popup = require("awful.hotkeys_popup")


myawesomemenu = {
	{
		'hotkeys',
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ 'manual', terminal .. ' -e man awesome' },
	{ 'edit config', editor_cmd .. ' ' .. awesome.conffile },
	{ 'restart', awesome.restart },
	{
		'quit',
		function()
			awesome.quit()
		end,
	},
}

mymainmenu = awful.menu({ items = { 
	{ " awesome", myawesomemenu, beautiful.awesome_icon },
	{ "勒 reboot", "reboot" },
	{ " shutdown", "poweroff" },
	{ " lock", screen_lock },
	{ ' logout',
		function()
			awesome.quit()
		end,
	},
	}
})

menubar.utils.terminal = terminal




awful.mouse.append_global_mousebindings({
	awful.button({ }, 3, function () mymainmenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewprev),
	awful.button({ }, 5, awful.tag.viewnext),
})