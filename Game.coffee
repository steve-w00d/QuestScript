canvas = document.getElementById('game')
ctx = canvas.getContext('2d')

class Game
	constructor: (@name, @canvas=canvas)->
		@currentScreen = new Screen('startScreen')
		@screens = [@currentScreen]
		@initGraphics()

	initGraphics: ->
		@canvas.height = 16 * 16
		@canvas.width = 16 * 16

class Screen
	constructor: (@name)->
		@elements = []
	
	clear: ->
		@clearRect(0,0, canvas.width, canvas.height)

	redraw: ->
		@clear()
		for el in @elements:
			el.move()
			ctx.drawImage(el.sprite, el.x, el.y)

	addToScreen: (element)->
		@elements.push element
