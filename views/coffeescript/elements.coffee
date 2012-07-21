exports = this
$ ->
  class Person extends Element
    constructor: ->
      @sprite = 'sprites/box.png'
      @movement = walkRandomly
      @talk = 'I love cheese'
      Element.call(this, arguments[0], arguments[1])

  class Tree extends Element
    constructor: ->
      @sprite = 'sprites/tree.png'
      @movement = stand
      Element.call(this, arguments[0], arguments[1])

  exports.Tree = Tree
  exports.Person = Person
