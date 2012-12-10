class fi.Missile extends fi.BoardObject
  @width = 3
  @height = 14

  @sprite = 'images/sprites.png'
  @sprite_sx = 0
  @sprite_sy = 86

  constructor: ->
    @player = null
    @dy = 0
    super

  step: ->
    @y += @dy * fi.game.interval
    @x = 0 if @x < 0
    @x = fi.game.width - @constructor.width if @x > fi.game.width - @constructor.width

    alien = fi.game.board.collide @
    alien.die() if alien

    @die() if @isFarAway()

  isFarAway: ->
    @y < 0 || @y > fi.game.height