const callbackPlusOne = function (num) {
  return num + 1;
};

Array.prototype.myEach = function (callbackMyEach) {
  // iterate over this
  for (let i = 0; i < this.length; i++) {
    // return callback result of the this[idx]
    callbackMyEach(this[i]);
  }
};

Array.prototype.myMap = function (callbackMyMap) {
  let result = [];
  this.myEach(function (num) {
    result.push(callbackMyMap(num));
  })
  return result;
};

let mapped = [1, 2, 3].myMap(callbackPlusOne);