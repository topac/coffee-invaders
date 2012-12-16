# Globals stuff
window.Sinv =
  config: {}

window.puts = (string) ->
  console?.log? string


Sinv.scriptGroups = [
  [
    'javascripts/libs/jquery.js',
    'javascripts/libs/request_animation_frame.js'
  ],
  [
    'javascripts/libs/sugar.min.js',
    'javascripts/engine/board.js'
  ],
  [
    'javascripts/engine/board_object.js',
    'javascripts/engine/board_object_group.js',
    'javascripts/engine/keyboard.js',
    'javascripts/engine/game.js',
    'javascripts/engine/message_board.js',
    'javascripts/engine/game_board.js'
  ],
  [
    'javascripts/game/fleet.js'
    'javascripts/game/player.js',
    'javascripts/game/missile.js'
    'javascripts/game/alien.js'
  ]
]


class Sinv.Loader
  constructor: ->
    @_requireScriptGroup 0
    @resolution = {width: 320, height: 480}

  _requireScriptGroup: (index) ->
    if Sinv.scriptGroups[index]
      require Sinv.scriptGroups[index], =>
        @_requireScriptGroup index + 1
    else
      $ @_onDocumentReady

  _onDocumentReady: =>
    @_startTheGame()

  _startTheGame: ->
    @_createCanvasElement()
    window.Sinv.game = new Sinv.Game '#gameboard'
    Sinv.game.loadBoard Sinv.MessageBoard
    Sinv.game.start()

  _createCanvasElement: ->
    body = $ 'body'
    canvasElement = $ '<canvas id="gameboard" height="'+@resolution.height+'px" width="'+@resolution.width+'px">'
    canvasElement.appendTo body
    body.css 'min-width', "#{@resolution.width}px"
    body.css 'min-height', "#{@resolution.height}px"


new Sinv.Loader()