class fi.Game
  constructor: (canvas) ->
    @canvasEl = $ canvas
    @canvas = @canvasEl[0].getContext '2d'
    @width = @canvasEl.width()
    @height = @canvasEl.height()
    @keyboard = new fi.Keyboard()
    @interval = 60/1000

  currentBoardIs: (BoardClassName) ->
    return if @board?.constructor is BoardClassName

  loadBoard: (BoardClassName, options = {}) ->
    # return if @currentBoardIs(BoardClassName) TODO - it works?
    @board = new BoardClassName()
    @board.load options

  start: ->
    return false if @started
    @started = true
    @stepAndRender()

  clear: ->
    @canvas.clearRect 0, 0, @width, @height

  stepAndRender: =>
    @board.step @
    @board.render @canvas
    window.requestAnimationFrame @stepAndRender