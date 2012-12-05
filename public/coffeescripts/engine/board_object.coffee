class fi.BoardObject extends fi.ClassAttributes
  @sprite: (url, sx, sy)->
    @classAttributes url: url, sx: sx, sy: sy

  @dimensions: (w, h)->
    @width = w
    @height = h
    @w = w
    @h = h
    @classAttributes width: w, height: h

  constructor: (game)->
    @canBeDrew = false
    @width  = @class().width
    @height = @class().height
    @w = @width
    @h = @height
    @x = 0
    @y = 0
    @_loadImage()
    @game = game

  die: ->
    @canBeDrew = false
    @game.board.removeObject @

  draw: (x=@x, y=@y, frame=@frame)->
    return unless @canBeDrew
    frame = 0 unless frame
    @game.canvas.drawImage(@image,
      @class().sx + frame * @class().width, @class().sy, @class().width,
      @class().height, x, y, @class().width, @class().height)

  step: ->
    throw "#step not implemented yet"

  _hasImage: ->
    @class().url

  _loadImage: ->
    return @canBeDrew = true unless @_hasImage()
    @image = new Image()
    @image.onload = => @canBeDrew = true
    @image.src = @class().url
