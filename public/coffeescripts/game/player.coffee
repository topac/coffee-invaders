class fi.Player extends fi.BoardObject
  @dimensions 26, 17
  @sprite 'images/sprites.png', 0, 36
  @classAttributes {missilesDelay: 10}

  constructor: ->
    @reloading = @class().missilesDelay
    super
    @speed = @game.width / 5

  launchMissile: ->
    @reloading = @class().missilesDelay
    @game.board.addObject fi.Missile,
      x: @x + @w/2 - fi.Missile.width/2
      y: @y - @h
      player: @
      dy: -100

  step: ->
    @x -= @speed * @game.interval if @game.keyboard.isKeyPressed 'left'
    @x += @speed * @game.interval if @game.keyboard.isKeyPressed 'right'
    @x = 0 if @x < 0
    @x = @game.width-@w if @x > @game.width - @w
    @reloading -= 1
    if @game.keyboard.isKeyPressed('fire') && @reloading <= 0
      @launchMissile()