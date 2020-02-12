// const sum = function () {
//   const args = Array.prototype.slice.call(arguments);
//   let sum = 0;

//   args.forEach((el) => {
//     sum += el;
//   });

//   return sum;
// };

const sum = function (...args) {
  let sum = 0;

  args.forEach((el) => {
    sum += el;
  });

  return sum;
};

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

// Function.prototype.myBind = function() {
//   // debugger
//   let args = Array.prototype.slice.call(arguments);
//   let ctx = arguments[0];
//   let rest = args.slice(1);
//   let that = this;
//   // return rest;

//   return function(...rest) { 
//     // debugger
//     let bArgs = Array.prototype.slice.call(arguments);
//     rest.concat(bArgs);
//     that.apply(ctx, rest);
//   }
// }

Function.prototype.myBind = function (...bindArgs) {
  // debugger
  let ctx = bindArgs[0];
  let callArgs = bindArgs.slice(1);
  let that = this;
  // return rest;

  return function (...callArgs) {
    // debugger
    let allArgs = callArgs.concat(bindArgs);
    that.apply(ctx, allArgs);
  }
}


class Cat {
  constructor(name) {
    this.name = name;
  }
  
  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}
// let c = new Cat('markov');
// let p = new Cat('pavlov');
// console.log(c.says.myBind(p,'2','3'));

// c.says.myBind(p)("meow", "a tree");

let callback = function (arr) {
  arr.forEach( { el
  })
}

const curriedSum = function(numArgs, callback) {
  let numbers = [];
  // let total = 0;

  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return callback(numbers);
    } else { 
      return _curriedSum;
    }
    // return total;
  };
};

// const brad = curriedSum(4);

console.log(curriedSum(4)(1)(2));

Function.prototype.curry = function (numArgs) {
  let that = this;
  let args = [];

  return _curriedFtn (arg) {
    args.push(arg);
    if (numArgs.length === args.length) {
      return that(...args);
    } else {
      return _curriedFtn (arg);
    }
  }
}

console.log()