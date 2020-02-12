const Game = require("./game.js");

const GameView = function(game, ctx) {
  this.game = game;
  this.ctx =ctx;
}

GameView.prototype.start = function() {
  let that = this;
  setInterval(function(){
    that.game.draw(that.ctx);
    that.game.moveObjects();
  }, 20)
};


module.exports = GameView;