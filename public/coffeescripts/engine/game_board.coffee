class Sinv.GameBoard extends Sinv.Board
  addObject: (className, options={}) ->
    @objects ||= []
    object = new className()
    for prop of options
      object[prop] = options[prop]
    @objects.push object
    object

  removeObject: (object) ->
    @objects.remove object

  foreachObject: (callback) ->
    for object in @objects
      callback object if object != undefined
    null

  load: (level) ->
    @player = @addObject Sinv.Player,
      x: Sinv.game.width/2
      y: Sinv.game.height - Sinv.Player.height - 10

    @fleet = @addObject Sinv.Fleet

  step: ->
    @foreachObject (object) -> object.step()

  render: ->
    Sinv.game.clear()
    @foreachObject (object) -> object.draw()

  collision: (o1, o2) ->
    !((o1.y+o1.constructor.height-1<o2.y) || (o1.y>o2.y+o2.constructor.height-1) ||
      (o1.x+o1.constructor.width-1<o2.x) || (o1.x>o2.x+o2.constructor.width-1))

  collide: (objectA) ->
    @objects.find (objectB) =>
      if objectA !=  objectB && !objectB.isAGroup #&& !objectB.invulnrable
       return @collision(objectA, objectB) ? objectB : false