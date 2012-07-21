Joystick = (->
	UP		= 0
	LEFT	= 1
	DOWN	= 2
	RIGHT	= 3
	direction	= 0
	intent  = false

	# public methods -----------------
	pub = {}

	pub.setIntent = (bool) ->
		intent = bool

	pub. getIntent = (bool) ->
		intent

	pub.setDirection = (code) ->
		switch code
			when 37
				direction = LEFT
			when 38
				direction = UP
			when 39
				direction = RIGHT	
			when 40
				direction = DOWN

	pub.getDirection = ->
		direction

	pub.setDegree = (degree) ->
		if degree > 245 and degree < 295
			pub.setDirection 37 # LEFT
		else if degree > 335 and degree < 25
			pub.setDirection 38 # UP
		else if degree > 75 and degree < 115
			pub.setDirection 39 # RIGHT
		else if degree > 165 and degree < 205
			pub.setDirection 40 # DOWN

	pub
)
