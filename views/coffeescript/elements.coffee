exports = this
$ ->
  class Person extends Element
    constructor: ->
      @sprite = 'public/sprites/box.png'
      @move = walkRandomly
      @talk = 'I love cheese'

  class Tree extends Element
    constructor: ->
      @sprite = 'public/sprites/tree.png'

  exports.Tree = Tree
  exports.Person = Person
