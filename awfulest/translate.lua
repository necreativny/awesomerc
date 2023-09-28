local awful = require('awful')












-- awesome.connect_signal('translate::val:request', function()
-- 	awful.spawn.easy_async_with_shell('', function(out)
-- 		awesome.emit_signal('translate::val:response', out)
-- 	end)
-- end)



-- current selection
-- xclip -o



awesome.connect_signal('translate::speak_source', function()
	awful.spawn.with_shell('crow -a -u '..source_text)
end)
awesome.connect_signal('translate::speak_trans', function()
	awful.spawn.with_shell('crow -a -p '..trans_text)
end)
awesome.connect_signal('translate::copy_source', function()
	awful.spawn.with_shell('echo '..source_text..'| xclip -sel clip')
end)
awesome.connect_signal('translate::copy_trans', function()
	awful.spawn.with_shell('echo '..trans_text..'| xclip -sel clip')
end)
