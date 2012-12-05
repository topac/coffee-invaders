class fi.Alien extends fi.BoardObject
  @dimensions 23, 18
  @sprite 'images/sprites.png', 0, 0

  constructor: ->
    @frame = 0
    super

  step: ->
    # do nothing