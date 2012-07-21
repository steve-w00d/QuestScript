exports = this
$ ->
  class Person extends Element
    constructor: ->
      Element.call(this, arguments[0], arguments[1])
      @sprite = 'public/sprites/box.png'
      @movement = walkRandomly
      @talk = 'I love cheese'

  class Tree extends Element
    Element.call(this, arguments[0], arguments[1])
    constructor: ->
      @sprite = 'public/sprites/tree.png'

  exports.Tree = Tree
  exports.Person = Person
