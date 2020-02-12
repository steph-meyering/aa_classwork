const Asteroid = require("./asteroid.js")

const DEFAULTS = {
  DIM_X: 800,
  DIM_Y: 600,
  NUM_ASTEROIDS: 100
};

const Game = function () {
  this.dim_x = DEFAULTS.DIM_X,
  this.dim_y = DEFAULTS.DIM_Y,
  this.num_asteroids = DEFAULTS.NUM_ASTEROIDS,
  this.asteroids = [];
  while (this.asteroids.length !== this.num_asteroids) {
    this.asteroids.push(this.addAsteroids());
  }
};

Game.prototype.randomPositions = function () {
  let x = Math.random() * DEFAULTS.DIM_X;
  let y = Math.random() * DEFAULTS.DIM_Y;
  return [x, y];
}

Game.prototype.addAsteroids = function () {
  let that = this;
  let randPos = that.randomPositions()
  return new Asteroid({pos: randPos});
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, DEFAULTS.DIM_X, DEFAULTS.DIM_Y);
  this.asteroids.forEach(function(asteroid) {
    asteroid.draw(ctx);
  });
}

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(function(asteroid){
    asteroid.move();
  });
};

Game.prototype.wrap = function(pos) {
  let x = pos[0] % DEFAULTS.DIM_X;
  let y = pos[1] % DEFAULTS.DIM_Y;
  return [x, y];
};

module.exports = Game;