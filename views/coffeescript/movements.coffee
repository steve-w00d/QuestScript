exports = this
$ ->
  stand = ->
    {x: @x, y: @y}
  
  walkRandomly = ->
    r = Math.random()
    if r < 0.25
      { x:@x-1, y:@y }
    else if r < 0.50
      { x:@x+1, y:@y }
    else if r < 0.75
      { x:@x, y:@y-1 }
    else
      { x:@x, y:@y+1 }

  exports.walkRandomly = walkRandomly
  exports.stand = stand
