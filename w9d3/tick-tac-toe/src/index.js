

const View = require('./ttt-view.js') // require appropriate file
const Game = require('../../ttt-solutions/game.js')// require appropriate file

  $(() => {
    window.game = new Game()
    window.$el = $(".ttt")
    window.view = new View(window.game, window.$el)
    // window.view.setupBoard()
  });
  // window.game = game
  // window.view = new View()