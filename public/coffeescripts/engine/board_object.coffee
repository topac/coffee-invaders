class fi.BoardObject
  constructor: ->
    @canBeDrew = false
    @x = 0
    @y = 0
    @frame = 0
    @_loadImage()

  die: ->
    @canBeDrew = false
    fi.game.board.removeObject @

  draw: (x=@x, y=@y, frame=@frame) ->
    return unless @canBeDrew
    frame = 0 unless frame
    fi.game.canvas.drawImage(@image,
      @constructor.sprite_sx + frame * @constructor.width, @constructor.sprite_sy, @constructor.width,
      @constructor.height, x, y, @constructor.width, @constructor.height)

  step: ->
    throw "#step not implemented yet"

  _hasImage: ->
    @constructor.sprite

  _loadImage: ->
    return @canBeDrew = true unless @_hasImage()
    @image = new Image()
    @image.onload = => @canBeDrew = true
    @image.src = @constructor.sprite
