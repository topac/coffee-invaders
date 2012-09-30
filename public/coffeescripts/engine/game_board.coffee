class fi.GameBoard extends fi.Board
  # TODO what to do with the options hash?
  addObject: (className, options={})->
    @objects ||= []
    object = new className(@game)
    for prop of options
      object[prop] = options[prop]
    @objects.push object
    object

  removeObject: (object)->
    index = @objects.indexOf object
    @objects.splice index, 1

  load: (level)->
    @player = @addObject fi.Player,
      x: @game.width/2
      y: @game.height - fi.Player.height - 10

  foreachObject: (callback)->
    for object in @objects
      callback object

  clearBoard: ->
    @game.canvas.clearRect 0, 0, @game.width, @game.height

  step: ->
    @foreachObject (object)-> object.step()

  render: ->
    @clearBoard()
    @foreachObject (object)-> object.draw()