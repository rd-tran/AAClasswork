Array.prototype.uniq = function() {
  let result = [];

  for (let i = 0; i < this.length; i++) {
    if (!result.includes(this[i])) {
      result.push(this[i]);
    }
  }

  return result;
}

Array.prototype.twoSum = function() {
  let pairs = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }

  return pairs;
}

Array.prototype.transpose = function() {
  let result = [];
  let colLength = this[0].length;
  let rowLength = this.length;

  for (let i = 0; i < colLength; i++) {
    let newRow = [];
    for (let j = 0; j < rowLength; j++) {
        let ele = this[j][i];
        newRow.push(ele);
    }
    result.push(newRow);
  }

  return result;
}

// let arr = [
//   [1,2,3],
//   [4,5,6]
// ];
// console.log(arr.transpose());
// [
//   [1,4],
//   [2,5],
//   [3,6]
// ]