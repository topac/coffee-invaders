class fi.Player extends fi.BoardObject
  @dimensions 26, 17
  @sprite 'images/sprites.png', 0, 36

  constructor: (game)->
    @speeed = 40
    @reloading = 40
    @dx = game.width / 5
    super

  launchMissile: ->
    @reloading = 10
    @game.board.addObject fi.Missile,
      x: @x + @w/2 - fi.Missile.width/2
      y: @y - @h
      player: @
      dy: -100

  step: ->
    @x -= @dx * @game.interval if @game.keyboard.isKeyPressed 'left'
    @x += @dx * @game.interval if @game.keyboard.isKeyPressed 'right'
    @x = 0 if @x < 0
    @x = @game.width-@w if @x > @game.width - @w
    @reloading -= 1
    if @game.keyboard.isKeyPressed('fire') && @reloading <= 0
      @launchMissile()