Joystick = (->
	UP		= 0
	LEFT	= 1
	DOWN	= 2
	RIGHT	= 3
	direction	= 0

	# public methods -----------------
	pub = {}
	pub.setDirection = (code) ->
		switch code
			when 38
				direction = UP
			when 37
				direction = LEFT
			when 40
				direction = DOWN
			when 39
				direction = RIGHT
	
	pub.getDirection = ->
		direction

	pub
)
