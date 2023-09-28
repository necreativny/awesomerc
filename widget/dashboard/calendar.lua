local wibox = require('wibox')

return wibox.widget {
	{
		date = os.date('*t'),
		start_sunday = true,
		widget = wibox.widget.calendar.month
	},
	halign = 'right',
	valign = 'bottom',
	widget = wibox.container.place
}
