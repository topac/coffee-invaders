class fi.Missile
  @data = {url: 'images/sprites.png', sx: 0,  sy: 86, w: 3,  h: 14, cls: Missile}

  constructor: (game)->
    @game = game
    @player = null
    @sprite = new fi.Sprite @game, fi.Missile.data
    @dy = 0
    @x = 0
    @y = 0

  draw: ->
    @sprite.draw @x, @y

  step: ->
    @y += @dy * @game.interval
    @x = 0 if @x < 0
    @x = @game.width-@w if @x > @game.width - @w
    # TODO handle collision implmenting a die() func
    @y < 0 || @y > @game.height