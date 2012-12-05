class fi.Fleet extends fi.BoardObjectGroup
  @classAttributes {margin: 50}

  # TODO - refactor! @addObject method, and the fact that the contructor accept the game object
  constructor: ->
    @speed = 10
    @spaceBetweenAliens = 10
    @horizontalDirection = 1
    @movingDownStep = false
    @mx = 0
    @movingDownStep = false
    @marginRight = 60
    super
    @height = fi.Alien.height + 25
    for i in [0..9]
      @addObject @game.board.addObject fi.Alien,
        x: @marginRight + fi.Alien.width*i + @spaceBetweenAliens*i
        y: @height

    @x = @marginRight

  isCloseToBorders: ->
    @objects.first().x < @class().margin || @objects.last().x  > (@game.width - @class().margin - fi.Alien.width - @spaceBetweenAliens)

  shouldFlyDown: ->
    !@movingDownStep and @isCloseToBorders()

  flyDown: ->
    @height += fi.Alien.height + 2
    @_foreachObject (alien) =>
      alien.y = @height
    @horizontalDirection *= -1

  shouldMove: ->
    Math.abs(@mx) > 10

  step: ->
    @_startStep()
    @mx += @game.interval * @speed * @horizontalDirection
    if @shouldMove()
      if @shouldFlyDown()
        @movingDownStep = true
        @flyDown()
      else
        @_foreachObject (alien) =>
          alien.x += @mx
        @movingDownStep = false
      @mx = 0
    @_endStep()
