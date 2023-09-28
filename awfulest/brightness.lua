local awful = require('awful')



get_brightness = function()
	return tonumber(io.popen("xbacklight -get"):read())
end

awesome.connect_signal('brightness::val:request', function()
	awesome.emit_signal('brightness::val:post', get_brightness())
end)

awesome.connect_signal('brightness::set', function(val)
	awful.spawn.with_shell('xbacklight -set '..val)
end)

awesome.connect_signal('brightness::toogle', function(val)
	awful.spawn.with_shell('pactl set-source-mute 0 toggle')
end)
