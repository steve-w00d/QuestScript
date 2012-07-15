

class GameScreen
	constructor: (@ctx)->
		@frame = 0
		@elements = []
	
	redraw: ->
		@ctx.clear()
		for el in @elements:
			el.move()
			@ctx.drawImage(el.sprite, el.x, el.y)
	
		# think of a better way of frame count.	i don't know if a standard count is needed.
		# binary?
		@frame += 1

	addToScreen: (element)->
		@elements.push element




class Game
	constructor: (@name)->
		canvas = document.getElementById('game')
		canvas.height = 16 * 16
		canvas.width = 16 * 16
		@ctx = canvas.getContext('2d')
		@ctx.clear = ->
			@clearRect(0,0, canvas.width, canvas.height)
		startScreen = new GameScreen(@ctx)
		@currentScreen = startScreen
		@screens = [@currentScreen]	
		
		setInterval (that)->
			that.@screens.map (s)->
				s.redraw()
		, 600, @

	screen: (screenName)->
		screen = new GameScreen(@ctx)
		@screens.push screen
		screen
	
