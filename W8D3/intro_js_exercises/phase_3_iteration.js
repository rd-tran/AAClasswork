Array.prototype.bubbleSort = function() {
    let sortedArray = this.slice();
    let sorted = false;

    while (!sorted) {
        sorted = true;
        for (let i = 0; i < this.length; i++) {
            let ele1 = sortedArray[i];
            let ele2 = sortedArray[i+1];
            if (ele1 > ele2) {
                sorted = false;
                sortedArray[i] = ele2;
                sortedArray[i+1] = ele1;
            }
        }
    }

    return sortedArray;
}

// let arr = [3,2,6,1,7]
// console.log(arr.bubbleSort());

String.prototype.substrings = function() {
    let subsArr = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j <= this.length; j++) {
            subsArr.push(this.substring(i,j));
        }
    }

    return subsArr;
}

let str = 'abc'
console.log(str.substrings());