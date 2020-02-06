Array.prototype.uniq = function() { 
  let output = [];

  // this.forEach(function(num) {
  //   if (!output.includes(num)) {
  //     output.push(num);
  //   }
  // });

  for (let i = 0; i < this.length; i++) {
    if (!output.includes(this[i])) {
      output.push(this[i]);
    }
  }

  return output;
}


Array.prototype.twoSum = function() {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i+1; j < this.length; j++) {
      if (this[i] + this[j] === 0){
        result.push([this[i], this[j]]);
      }
    }
  }
  return result;
}

Array.prototype.transpose = function() {
  let result = new Array(this[0].length);
  for (let i = 0; i < result.length; i++) {
    result[i] = new Array(this.length);
  }
  for (let i = 0; i < this[0].length; i++) {
    for (let j = 0; j < this.length; j++) {
      result[i][j] = this[j][i];
    }
  }
  return result;
}