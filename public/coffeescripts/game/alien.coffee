class fi.Alien extends fi.BoardObject
  @dimensions 23, 18
  @sprite 'images/sprites.png', 0, 0
  @classAttributes {margin: 50}

  constructor: ->
    @speed = 20
    @horizontalDirection = 1
    @movingDownStep = false
    @mx = 0
    @frame = 0
    super

  isCloseToBorders: ->
    @x < @class().margin || @x > (@game.width - @class().margin)

  switchHorizontalDirection: ->
    @y += @height
    @horizontalDirection *= -1
    @movingDownStep = true

  shouldMove: ->
    Math.abs(@mx) > 10

  step: ->
    @mx += @game.interval * @speed * @horizontalDirection
    if @shouldMove()
      if !@movingDownStep and @isCloseToBorders()
        @switchHorizontalDirection()
      else
        @x += @mx
        @movingDownStep = false
      @mx = 0
      # TODO launch some missiles sometimes
      # if(this.y == this.flock.max_y[this.x]) {this.fireSometimes();}
      # TODO change frame
      # this.frame = (this.frame+1) % 2;

      # TODO handle collisions
      # if(this.x > Game.width - Sprites.map.alien1.w * 2) this.flock.hit = -1;
      # if(this.x < Sprites.map.alien1.w) this.flock.hit = 1;
    true