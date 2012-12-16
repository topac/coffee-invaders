class Sinv.Player extends Sinv.BoardObject
  @width = 26
  @height = 17

  @sprite = 'images/sprites.png'
  @sprite_sx = 0
  @sprite_sy = 36

  constructor: ->
    super
    @missilesDelay = Sinv.game.interval + 30
    @reloading = @missilesDelay
    @speed = Sinv.game.interval + 30
    @minX = 0
    @maxX = Sinv.game.width - @constructor.width

  launchMissile: ->
    @reloading = @missilesDelay
    Sinv.game.board.addObject Sinv.Missile,
      x: @x + @constructor.width/2 - Sinv.Missile.width/2
      y: @y - @constructor.height
      player: @
      dy: -100

  step: ->
    @x -= @speed * Sinv.game.interval if Sinv.game.keyboard.isKeyPressed 'left'
    @x += @speed * Sinv.game.interval if Sinv.game.keyboard.isKeyPressed 'right'
    # Stay into boundaries
    @x = @minX if @x < @minX
    @x = @maxX if @x > @maxX

    @reloading -= 1
    if Sinv.game.keyboard.isKeyPressed('fire') && @reloading <= 0
      @launchMissile()