class fi.Player
  @data = {url: 'images/sprites.png', sx: 0,  sy: 36, w: 26, h: 17, cls: Player}

  constructor: (game)->
    @game = game
    @speeed = 40
    @reloading = 0
    @sprite = new fi.Sprite @game, fi.Player.data
    @x = 0
    @y = 0
    @w = @sprite.options.w
    @h = @sprite.options.h
    @dx = @game.width / 5

  draw: ->
    @sprite.draw @x, @y

  step: ->
    @x -= @dx * @game.interval if @game.keyboard.isKeyPressed 'left'
    @x += @dx * @game.interval if @game.keyboard.isKeyPressed 'right'
    @x = 0 if @x < 0
    @x = @game.width-@w if @x > @game.width - @w

    @reloading -= 1

    # if @game.keyboard.isKeyPressed 'fire' && @reloading <= 0 #&& this.board.missiles < 3
    #   addObject fi.Missile, @x + @x/2 - 3/2, @y-@h, { dy: -100, player: true }
    # this.board.addSprite('missile',
    #                       this.x + this.w/2 - Sprites.map.missile.w/2,
    #                       this.y-this.h,
    #                       { dy: -100, player: true });
    # this.board.missiles++;
    # this.reloading = 10;