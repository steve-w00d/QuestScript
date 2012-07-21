exports = this
$ ->
  canvas = document.getElementById('game') 
  ctx = canvas.getContext('2d')
  stepsPerMove = 5

  class Game
    constructor: (@name, @canvas = canvas)->
      @currentScreen = new Screen('startScreen')
      @screens = [@currentScreen]
      @initGraphics()

    initGraphics: ->
      canvas.height = 8 * 16
      canvas.width = 16 * 16

  class Screen
    constructor: (@name)->
      @elements = []
      @initGrid()
    
    initGrid: ->
      @grid = new Array(10)
      for x in [0..9]
        @grid[x] = new Array(10)

    clear: ->
      ctx.clearRect(0,0, canvas.width, canvas.height)

    moveElements: ->
      for el in @elements
        el.move()
        if @grid[el.expectedX][el.expectedY]?
          el.dontMove()
    
    redraw: ->
      @clear()
      for el in @elements
        ctx.drawImage(el.sprite, el.currentX, el.currentY)
    
    addToScreen: (element)->
      @elements.push element

  game = new Game('Adventure Quest')
  
  class Element
    constructor: (@x=0, @y=0)->
      @sprite = @movement = null
      @expected_x = @x, @expected_y = @y
      game.currentScreen.addToScreen(this)
    
    says: (@speech)->
    talk: ->
      console.log @speech
    
    is: (@sprite)->
    does: (@movement)->

    move: ->
      if @x is @expectedX and @y is @expectedY
        m = @movement()
        @expectedX = m.x
        @expectedY = m.y
      @currentX += (@expectedX - @x)/stepsPerMove
      @currentY += (@expectedY - @y)/stepsPerMove
    dontMove: ->
      @expectedX = @x
      @expectedY = @y
  
  # export
  exports.Screen = Screen
  exports.Element = Element
  exports.game = game
