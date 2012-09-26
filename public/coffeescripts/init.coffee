$ ->
  fi.game = new fi.Game '#gameboard'

  fi.game.loadBoard fi.MessageBoard,
    title: "coffee-invaders"
    subtitle: "THE GAME"
    onFirePressed: ->
      fi.game.loadBoard fi.GameBoard, 1

  fi.game.startLoop()