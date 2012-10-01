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
    @objects.remove object

  load: (level)->
    @player = @addObject fi.Player,
      x: @game.width/2
      y: @game.height - fi.Player.height - 10

    @addObject fi.Alien,
      x: @game.width/2
      y: @game.height/10

  foreachObject: (callback)->
    for object in @objects
      callback object if object != undefined
    null

  clearBoard: ->
    @game.canvas.clearRect 0, 0, @game.width, @game.height

  step: ->
    @foreachObject (object)-> object.step()

  render: ->
    @clearBoard()
    @foreachObject (object)-> object.draw()

  collision: (o1, o2)->
    !((o1.y+o1.h-1<o2.y) || (o1.y>o2.y+o2.h-1) || (o1.x+o1.w-1<o2.x) || (o1.x>o2.x+o2.w-1))

  collide: (objectA)->
    @objects.find (objectB)=>
      if objectA !=  objectB#&& !objectB.invulnrable
       return @collision(objectA, objectB) ? objectB : false