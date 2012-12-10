class fi.MessageBoard extends fi.Board
  load: ->
    @title = "coffee-invaders"
    @subtitle = "the game"

  loadGameBoard: ->
    fi.game.loadBoard fi.GameBoard

  step: ->
    @loadGameBoard() if fi.game.keyboard.isFirePressed()

  render: ->
    @canvas = fi.game.canvas
    fi.game.clear()
    @_renderTitle()
    @_renderSubtitle()

  _renderTitle: ->
    @canvas.font = "bold 40px arial"
    measure = @canvas.measureText @title
    @canvas.fillStyle = "#FFFFFF"
    @canvas.fillText @title, fi.game.width/2 - measure.width/2,fi.game.height/2

  _renderSubtitle: ->
    @canvas.font = "bold 20px arial"
    measure2 = @canvas.measureText @subtitle
    @canvas.fillText @subtitle, fi.game.width/2 - measure2.width/2,fi.game.height/2 + 40
