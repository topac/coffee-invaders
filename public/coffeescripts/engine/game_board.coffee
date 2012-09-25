class fi.GameBoard extends fi.Board
  # TODO what to do with the options hash?
  addObject: (className, options={})->
    @objects ||= []
    object = new className(@game)
    for prop of options
      object[prop] = options[prop]
    @objects.push object
    object

  laodLevel: (level={})->
    @player = @addObject fi.Player,
      x: @game.width/2
      y: @game.height - fi.Player.data.h - 10

  load: (level)->
    console.log "loading game board"
    @laodLevel level

  foreachObject: (callback)->
    for object in @objects
      callback object

  step: ->
    @foreachObject (object)-> object.step()

  render: ->
    @game.canvas.clearRect(0, 0, @game.width, @game.height)
    # this.iterate(function() { this.draw(canvas); });
    @foreachObject (object)-> object.draw()