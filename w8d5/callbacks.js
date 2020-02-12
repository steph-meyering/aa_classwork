class Clock {
    constructor() {
        this.date = new Date();
        this.h = this.date.getHours();
        this.m = this.date.getMinutes();
        this.s = this.date.getSeconds();
        // this.hours = this.date.getHours()
        this.printTime();

        // this._tick = this._tick.bind(this)
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        // [this.h,this.m,this.s].map((el) => {
        //     if (el.length === 2) {
        //         return el = `0${el}`
        //     } else {
        //         return el
        //     }
        // });
        console.log(`${this.h}:${this.m}:${this.s}`)
    }

    _tick() {
        this.s++
        if (this.s === 60) {
            this.m++;
            this.s = 0;
        };
        if (this.m === 60) {
            this.h++;
            this.m = 0;
        };
        this.printTime();
    }
}

// const clock = new Clock();
// console.log(clock);
// clock.printTime()

const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft === 0) {
        reader.close();
        return completionCallback(sum);
    }

    reader.question("Please enter a number: ", function (strNum) {
        const num = parseInt(strNum)
        sum += num;
        console.log(`Current sum: ${sum}!`);
        numsLeft--
        // console.log(numsLeft--)
        return addNumbers(sum, numsLeft, completionCallback);
    });
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


function askIfGreaterThan(el1, el2, callback) {
    reader.question(`Is ${el1} greater than ${el2}? (y/n)`, function(answer){
        if (answer === "y") {
            callback(true);
        } else {
            callback(false);
        };
        reader.close();
    });
}


function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i < arr.length-1) {
        askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan){
            if (isGreaterThan) {
                [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]]
                madeAnySwaps = true;
            }
        })
        i++
        innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop)
    }
}

// console.log(askIfGreaterThan(1,2,function(arg){console.log(arg)}))