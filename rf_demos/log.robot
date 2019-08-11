*** Test Cases ***
Example
	Log	Hello, world!			# Normal INFO message.
	Log	Warning, world!	WARN		# Warning.
	Log	<b>Hello</b>, world!	html=yes		# INFO message as HTML.
	Log	<b>Hello</b>, world!	HTML		# Same as above.
	Log	<b>Hello</b>, world!	DEBUG	html=true	# DEBUG as HTML.
	Log	Hello, console!	console=yes		# Log also to the console.
	Log	Null is \x00	formatter=repr		# Log 'Null is \x00'.
	
Log Many Example
    @{list} =    Create List          1    2    3
    &{dict} =    Create Dictionary    key=value    foo=bar	
    Log Many	 Hello    robot    
	Log Many	 @{list}	&{dict} 
