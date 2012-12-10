class fi.Alien extends fi.BoardObject
  @width = 23
  @height = 18

  @sprite = 'images/sprites.png'
  @sprite_sx = 0
  @sprite_sy = 0

  constructor: ->
    @frame = 0
    super

  step: ->
    # do nothing
    # overwritten by fleet#step