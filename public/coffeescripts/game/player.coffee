class fi.Player extends fi.BoardObject
  @width = 26
  @height = 17

  @sprite = 'images/sprites.png'
  @sprite_sx = 0
  @sprite_sy = 36

  constructor: ->
    super
    @missilesDelay = fi.game.interval + 40
    @reloading = @missilesDelay
    @speed = fi.game.interval + 30
    @minX = 0
    @maxX = fi.game.width - @constructor.width

  launchMissile: ->
    @reloading = @missilesDelay
    fi.game.board.addObject fi.Missile,
      x: @x + @constructor.width/2 - fi.Missile.width/2
      y: @y - @constructor.height
      player: @
      dy: -100

  step: ->
    @x -= @speed * fi.game.interval if fi.game.keyboard.isKeyPressed 'left'
    @x += @speed * fi.game.interval if fi.game.keyboard.isKeyPressed 'right'
    # Stay into boundaries
    @x = @minX if @x < @minX
    @x = @maxX if @x > @maxX

    @reloading -= 1
    if fi.game.keyboard.isKeyPressed('fire') && @reloading <= 0
      @launchMissile()