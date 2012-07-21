exports = this
$ ->
  canvas = document.getElementById('game') 
  ctx = canvas.getContext('2d')

  class Game
    constructor: (@name, @canvas = canvas)->
      @currentScreen = new Screen('startScreen')
      @screens = [@currentScreen]
      @initGraphics()

    initGraphics: ->
      canvas.height = 16 * 16
      canvas.width = 16 * 16

  class Screen
    constructor: (@name)->
      @elements = []
    
    clear: ->
      @clearRect(0,0, canvas.width, canvas.height)

    moveElements: ->
      el.movement() for el in @elements
      
    redraw: ->
      @clear()
      for el in @elements
        ctx.drawImage(el.sprite, el.x, el.y)
    
    addToScreen: (element)->
      @elements.push element

  class Element
    constructor: (@x=0, @y=0)->
      @sprite = null
      game.currentScreen.addToScreen this
    
    says: (@speech)->
    talk: ->
      console.log @speech
    
    is: (@sprite)->
    does: (@movement)->

  # export
  exports.Screen = Screen
  exports.Element = Element
  exports.adventureQuest = new Game 'Adventure Quest'
