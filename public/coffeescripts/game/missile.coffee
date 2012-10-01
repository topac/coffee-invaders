class fi.Missile extends fi.BoardObject
  @dimensions 3, 14
  @sprite 'images/sprites.png', 0, 86

  constructor: ->
    @player = null
    @dy = 0
    super

  step: ->
    @y += @dy * @game.interval
    @x = 0 if @x < 0
    @x = @game.width-@w if @x > @game.width - @w

    # TODO handle collision with aliens
    alien = @game.board.collide @
    alien.die() if alien

    @die() if @isFarAway()

  isFarAway: ->
    @y < 0 || @y > @game.height