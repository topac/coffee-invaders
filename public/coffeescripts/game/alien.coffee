class fi.Alien extends fi.BoardObject
  @dimensions 23, 18
  @sprite 'images/sprites.png', 0, 0

  constructor: (game)->
    @game = game
    @dy = 0
    @x = 0
    @y = 0

    @horizontalDirection = 1
    @movingDownStep = false

    @mx = 0
    @frame = 0

    super

  draw: ->
    @_drawAt @x, @y

  die: ->
    @game.board.removeObject @

  isCloseToBorders: ->
    distance = @width * 2
    @x < distance || @x > (@game.width - distance)

  switchHorizontalDirection: ->
    @y += @height
    @horizontalDirection *= -1
    @movingDownStep = true

  step: ->
    @mx += @game.interval * 20 * @horizontalDirection

    if Math.abs(@mx) > 10

      if !@movingDownStep and @isCloseToBorders()
        @switchHorizontalDirection()
      else
        @x += @mx
        @movingDownStep = false
      # else
      #   @x += @mx
      #   @movingDownStep = false

      @mx = 0
      # TODO launch some missiles sometimes
      # if(this.y == this.flock.max_y[this.x]) {this.fireSometimes();}
      # TODO change frame
      # this.frame = (this.frame+1) % 2;

      # TODO handle collisions
      # if(this.x > Game.width - Sprites.map.alien1.w * 2) this.flock.hit = -1;
      # if(this.x < Sprites.map.alien1.w) this.flock.hit = 1;
    true