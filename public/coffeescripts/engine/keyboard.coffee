class Sinv.Keyboard
  KEY_CODES =
    37: 'left'
    39: 'right'
    32: 'fire'

  constructor: ->
    @keys = {}
    @_listen()

  isKeyPressed: (keyName) ->
    !!@keys[keyName]

  isFirePressed: ->
    @isKeyPressed 'fire'

  _keyUp: (event) =>
    @keys[KEY_CODES[event.keyCode]] = false if KEY_CODES[event.keyCode]

  _keyDown: (event) =>
    @keys[KEY_CODES[event.keyCode]] = true if KEY_CODES[event.keyCode]

  _listen: ->
    $(window).keydown(@_keyDown).keyup @_keyUp