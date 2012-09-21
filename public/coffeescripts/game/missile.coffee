class fi.Missile
  constructor: (game, player, dy)->
    @game = game
    @player = player
    @dy = dy
    @sprite = {url: 'images/sprites.png', sx: 0,  sy: 86, w: 3,  h: 14, cls: Missile}
    @x = 0
    @y = 0

  draw: ->
    @sprite.draw @x, @y

  step:->
    @y += @dy * @game.interval
    @x = 0 if @x < 0
    @x = @game.width-@w if @x > @game.width - @w
    # TODO handle collision
    @y < 0 || @y > @game.height