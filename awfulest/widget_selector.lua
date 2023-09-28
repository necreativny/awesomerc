local awful = require('awful')



local shazam_on = false
local shazam_use_micro = false
local record_on = false


awesome.connect_signal('widget_selector::shazam', function()
	if shazam_on then
		awful.spawn.with_shell('pkill songrec')
	else
		local params = (not shazam_use_micro and '-d pulse') or (shazam_use_micro and '')
		awful.spawn.with_shell('songrec listen'..params)
	end
	shazam_on = not shazam_on
end)

awesome.connect_signal('widget_selector::screenshot', function()
	awful.spawn.with_shell('flameshot gui')
end)

awesome.connect_signal('widget_selector::record', function()
	if record_on then
		awful.spawn.with_shell('ffmpeg -f x11grab -i :0.0 -f pulse -ac 2 -i default -f pulse -ac 1 -i default out.mkv')
	else
		awful.spawn.with_shell('pkill -SIGINT -f ffmpeg')
	end
	record_on = not record_on
end)

awesome.connect_signal('widget_selector::update', function()
	awful.spawn.with_shell('sudo pacman -Suy')
end)
