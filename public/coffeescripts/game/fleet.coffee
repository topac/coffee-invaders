class Sinv.Fleet extends Sinv.BoardObjectGroup
  @margin = 30

  constructor: ->
    super
    @speed = 20
    @vSpaceBetweenAliens = Sinv.Alien.height / 3
    @hSpaceBetweenAliens = Sinv.Alien.width / 3
    @height = Sinv.Alien.height + 25
    @horizontalDirection = 1
    @movingDownStep = false
    @x = @constructor.margin
    @mx = 0
    @_drawAliens()

  _drawAliens: ->
    lineCount = -1
    for i in [0..15]
      if i % 4 is 0
        lineCount += 1
        x = -1
      x += 1
      @addObject Sinv.game.board.addObject Sinv.Alien,
        x: @constructor.margin + Sinv.Alien.width*x + @hSpaceBetweenAliens*x
        y: @height + lineCount * (Sinv.Alien.height + @vSpaceBetweenAliens)

  isCloseToBorders: ->
    @objects.first().x < @constructor.margin || @objects.last().x  > (Sinv.game.width - @constructor.margin - Sinv.Alien.width - @hSpaceBetweenAliens)

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
