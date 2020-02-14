class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $ul = $('ul');
    const that = this;
    $ul.on('click', function() {
      $(event.target).addClass("clicked-square")
      console.log(event)
      console.log($(event.target).data()["pos"])
      that.makeMove($(event.target))    
    });
  }

  makeMove($square) {
    const pos = $square.data()["pos"]
    $square.html(`${this.game.currentPlayer}`)
    this.game.playMove(pos);

  }

  setupBoard() {
    const $figure = this.$el;
    const $ul = $('<ul class="board">');
    for (let i = 0; i < 9; i++) {
      const x = Math.floor(i/3);
      const y = i % 3;
      const $li = $("<li class='square'>").data("pos", [x,y]);
      $ul.append($li)
    }
    $figure.append($ul);

  }
}

module.exports = View;




