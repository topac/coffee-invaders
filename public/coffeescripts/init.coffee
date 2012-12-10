# Globals stuff
window.fi =
  config: {}

window.puts = (string) ->
  console?.log? string


fi.scriptGroups = [
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


class fi.Loader
  constructor: ->
    @_requireScriptGroup 0

  _requireScriptGroup: (index) ->
    if fi.scriptGroups[index]
      require fi.scriptGroups[index], =>
        @_requireScriptGroup index + 1
    else
      $ @_onDocumentReady

  _onDocumentReady: =>
    @_startTheGame()

  _startTheGame: ->
    window.fi.game = new fi.Game '#gameboard'
    fi.game.loadBoard fi.MessageBoard
    fi.game.start()


new fi.Loader()