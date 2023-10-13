local awful = require('awful')


local to_start = {
	'picom',
	'nm-applet',
	'flameshot',
	'setxkbmap us,ru,ua,de',
	'xset b off',
}


for _, cmd in ipairs(to_start) do
	awful.spawn.with_shell(cmd)
end