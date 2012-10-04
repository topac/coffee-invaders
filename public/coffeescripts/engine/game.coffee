class fi.Game
  constructor: (canvas)->
    @canvasEl = $ canvas
    @canvas = @canvasEl[0].getContext '2d'
    @width = @canvasEl.width()
    @height = @canvasEl.height()
    @keyboard = new fi.Keyboard()
    @interval = 23/1000

  loadBoard: (BoardClassName, options)->
    @board = new BoardClassName(@)
    @board.load options

  startLoop: ->
    return false if @loop
    @loop = setInterval @_loop, @interval

  _loop: =>
    @board.step @
    @board.render @canvas