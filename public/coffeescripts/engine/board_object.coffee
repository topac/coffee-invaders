class fi.BoardObject
  _classesData = []

  _addClassesData = (func, data) ->
    for classData in _classesData
      return Object.merge(classData, data) if func is classData.func
    _classesData.push Object.merge({func: func}, data)

  @dimensions: (w, h)->
    @width = w
    @height = h
    _addClassesData @, {width: w, height: h}

  constructor: (game)->
    dimensions = null
    @width  = @class().width
    @height = @class().height
    @w = @width
    @h = @height
    @x = 0
    @y = 0
    @image_loaded = false
    @_loadImage()
    @game = game

  draw: ->
    @_drawAt @x, @y

  class: ->
    return @_class if @_class
    for data in _classesData
      return @_class = data if @ instanceof data.func
    null

  _loadImage: ->
    @image = new Image()
    @image.onload = => @image_loaded = true
    @image.src = @spriteData.url

  _drawAt: (x, y, frame=0)->
    return unless @image_loaded
    frame = 0 unless frame
    s = Object.merge {w: @width, h: @height}, @spriteData
    if @image_loaded
      @game.canvas.drawImage(@image, s.sx + frame * s.w, s.sy, s.w, s.h, x, y, s.w, s.h)
