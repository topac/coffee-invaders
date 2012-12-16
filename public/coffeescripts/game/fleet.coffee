class Sinv.Fleet extends Sinv.BoardObjectGroup
  @margin = 50

  constructor: ->
    super
    @speed = 10
    @spaceBetweenAliens = 10
    @horizontalDirection = 1
    @movingDownStep = false
    @mx = 0
    @movingDownStep = false
    @marginRight = 60
    @height = Sinv.Alien.height + 25
    @x = @marginRight
    for i in [0..9]
      @addObject Sinv.game.board.addObject Sinv.Alien,
        x: @marginRight + Sinv.Alien.width*i + @spaceBetweenAliens*i
        y: @height

    # for i in [0..9]
    #   @addObject Sinv.game.board.addObject Sinv.Alien,
    #     x: @marginRight + Sinv.Alien.width*i + @spaceBetweenAliens*i
    #     y: @height + 30

  isCloseToBorders: ->
    @objects.first().x < @constructor.margin || @objects.last().x  > (Sinv.game.width - @constructor.margin - Sinv.Alien.width - @spaceBetweenAliens)

  shouldFlyDown: ->
    !@movingDownStep and @isCloseToBorders()

  flyDown: ->
    dy = Sinv.Alien.height + 2
    @height += dy
    @_foreachObject (alien) =>
      alien.y += dy
    @horizontalDirection *= -1

  shouldMove: ->
    Math.abs(@mx) > 10

  step: ->
    @_startStep()
    @mx += Sinv.game.interval * @speed * @horizontalDirection
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
