class Sinv.BoardObjectGroup
  constructor: ->
    @isAGroup = true # todo - find a more elegant way to check if is a group!
    @stepping = true
    @x = 0
    @y = 0
    @objects = []

  addObject: (object)->
    @objects.push object

  step: -> throw "#step not implemented yet"

  die: ->
    # todo - why is always called??

  draw: ->
    return if @stepping
    @_foreachObject (object) -> object.draw()

  _startStep: -> @stepping = true

  _endStep: -> @stepping = false

  _foreachObject: (callback)->
    for o in @objects
      callback o if o != undefined
    null
