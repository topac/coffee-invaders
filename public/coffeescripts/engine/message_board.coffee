class Sinv.MessageBoard extends Sinv.Board
  load: ->
    @title = "coffee-invaders"
    @subtitle = "the game"

  loadGameBoard: ->
    Sinv.game.loadBoard Sinv.GameBoard

  step: ->
    @loadGameBoard() if Sinv.game.keyboard.isFirePressed()

  render: ->
    @canvas = Sinv.game.canvas
    Sinv.game.clear()
    @_renderTitle()
    @_renderSubtitle()

  _renderTitle: ->
    @canvas.font = "bold 40px arial"
    measure = @canvas.measureText @title
    @canvas.fillStyle = "#FFFFFF"
    @canvas.fillText @title, Sinv.game.width/2 - measure.width/2,Sinv.game.height/2

  _renderSubtitle: ->
    @canvas.font = "bold 20px arial"
    measure2 = @canvas.measureText @subtitle
    @canvas.fillText @subtitle, Sinv.game.width/2 - measure2.width/2,Sinv.game.height/2 + 40
