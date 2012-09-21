class fi.Sprite
  constructor: (game, options)->
    @game = game
    @options = options
    @image_loaded = false
    @loadImage()

  loadImage: ->
    @image = new Image()
    @image.onload = => @image_loaded = true
    @image.src = @options.url

  draw: (x, y, frame=0)->
    frame = 0 unless frame
    s = @options
    if @image_loaded
      @game.canvas.drawImage(@image, s.sx + frame * s.w, s.sy, s.w, s.h, x, y, s.w, s.h)
