local awful = require('awful')



get_volume = function()
	return tonumber(io.popen("pamixer --get-volume"):read())
end

awesome.connect_signal('volume::val:request', function()
	awesome.emit_signal('volume::val:post', get_volume())
end)

awesome.connect_signal('volume::change', function(change)
	if change == 'up' then
		if get_volume() < max_volume then
			awful.spawn.with_shell('pactl -- set-sink-volume 0 +'..volume_step..'%')
		end
	elseif change == 'down' then
		awful.spawn.with_shell('pactl -- set-sink-volume 0 -'..volume_step..'%')
	end
	awesome.emit_signal('volume::update', get_volume())
end)

awesome.connect_signal('volume::toogle', function(change)
	awful.spawn.with_shell('pactl set-sink-mute 0 toggle')
end)

awesome.connect_signal('volume::set', function(val)
	if val < max_volume then
		awful.spawn.with_shell('pactl -- set-sink-volume 0 '..val..'%')
	end
end)


get_micro = function()
	return tonumber(io.popen(
		"awk '{print substr($5,0,length($5)-1)}' <(pactl get-source-volume 0)"
	):read())
end

awesome.connect_signal('micro::val:request', function()
	awesome.emit_signal('micro::val:post', get_micro())
end)

awesome.connect_signal('micro::set', function(val)
	-- if val < max_micro then
	awful.spawn.with_shell('pactl -- set-source-volume 0 '..val..'%')
	-- end
end)

awesome.connect_signal('micro::toogle', function(val)
	awful.spawn.with_shell('pactl set-source-mute 0 toggle')
end)
