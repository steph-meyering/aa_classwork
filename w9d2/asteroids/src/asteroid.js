const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");

const DEFAULTS = {
  COLOR: "#ff0000",
  RADIUS: 30
};

const Asteroid = function (options) {
  MovingObject.call(this, {
  pos: options.pos,
  color: DEFAULTS.COLOR,
  radius: DEFAULTS.RADIUS,
  vel: Util.randomVec(6)});
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;