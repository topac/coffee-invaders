class Sinv.Missile extends Sinv.BoardObject
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
    @y += @dy * Sinv.game.interval
    @x = 0 if @x < 0
    @x = Sinv.game.width - @constructor.width if @x > Sinv.game.width - @constructor.width

    alien = Sinv.game.board.collide @

    if alien
      alien.die()
      @die()

    if @isFarAway()
      @die()

  isFarAway: ->
    @y < 0 || @y > Sinv.game.height