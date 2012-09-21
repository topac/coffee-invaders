class fi.GameBoard extends fi.Board
  # TODO what to do with the options hash?
  addObject: (className, options={})->
    object = new className(@game)
    for prop of options
      object[prop] = options[prop]
    object

  laodLevel: (level={})->
    @player = @addObject fi.Player,
      x: @game.width/2
      y: @game.height - fi.Player.data.h - 10

  load: (level)->
    console.log "loading game board"
    @laodLevel level

  step: ->
    @player.step()

  render: ->
    @game.canvas.clearRect(0, 0, @game.width, @game.height)
    # this.iterate(function() { this.draw(canvas); });
    @player.draw()
