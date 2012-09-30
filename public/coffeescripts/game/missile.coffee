class fi.Missile extends fi.BoardObject
  @dimensions 3, 14
  @sprite 'images/sprites.png', 0, 86

  constructor: (game)->
    @game = game
    @player = null
    @dy = 0
    @x = 0
    @y = 0
    super

  die: ->
    @game.board.removeObject @

  step: ->
    @y += @dy * @game.interval
    @x = 0 if @x < 0
    @x = @game.width-@w if @x > @game.width - @w
    # TODO handle collision with aliens
    @die() if @isFarAway()

  isFarAway :->
    @y < 0 || @y > @game.height