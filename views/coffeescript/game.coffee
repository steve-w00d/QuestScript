exports = this
$ ->
  canvas = document.getElementById('game') 
  stepSize = 0.2

  class Game
    constructor: (@name, @canvas = canvas)->
      @currentScreen = new Screen('startScreen')
      @screens = [@currentScreen]
      @initGraphics()
      @beginLoop()

    initGraphics: ->
      canvas.height = 8 * 16
      canvas.width = 16 * 16
      @ctx = canvas.getContext('2d')
    
    beginLoop: ->
      screen = @currentScreen
      setInterval ->
        screen.clear()
        screen.moveElements()
        screen.draw()
      , 500

  class Screen
    constructor: (@name)->
      @elements = []
      @initGrid()
    
    initGrid: ->
      @grid = new Array(16)
      for x in [0..9]
        @grid[x] = new Array(8)

    clear: ->
      game.ctx.clearRect(0,0, canvas.width, canvas.height)

    moveElements: ->
      for el in @elements
        el.move()
        if @grid[el.expectedX][el.expectedY]?
          el.dontMove()
    
    draw: ->
      for el in @elements
        if el.spriteReady?
          game.ctx.drawImage(el.img, 16*el.currentX, 16*el.currentY)
    
    addToScreen: (element)->
      @elements.push element

  game = new Game('Adventure Quest')
  
  class Element
    constructor: (@x=0, @y=0)->
      @expectedX = @currentX = @x
      @expectedY = @currentY = @y
      @loadSprite(@sprite)
      game.currentScreen.addToScreen(this)
    
    loadSprite: (sprite)->
      @img = new Image()
      @spriteReady = false
      _this = this
      @img.onload = ->
        _this.spriteReady = true
      if sprite?
        @img.src = sprite

    says: (@speech)->
    talk: ->
      console.log @speech
    
    does: (@movement)->
    
    move: ->
      console.log @currentX, @expectedX, @currentY, @expectedY
      if @currentX is @expectedX and @currentY is @expectedY
        m = @movement()
        @expectedX = m.x
        @expectedY = m.y
      @currentX += (@expectedX - @x)*stepSize
      @currentY += (@expectedY - @y)*stepSize
      @currentX.toPrecision(2)
      @currentY.toPrecision(2)
    dontMove: ->
      @expectedX = @x
      @expectedY = @y
  
  # export
  exports.Screen = Screen
  exports.Element = Element
  exports.game = game
