Array.prototype.myEach = function(cb) {
    for (let i = 0; i < this.length; i++) {
        let ele = this[i];
        cb(ele);
    }
}

let arr = ['abc', 'hi', 'ryan']

function shout(str) {
  return str + '!'
}

// arr.myEach(ele => {
//   console.log(ele + '!');
// })

Array.prototype.myMap = function(cb) {
  let map = [];

  this.myEach((ele) => {
    map.push(cb(ele));
  })

  return map;
}

// console.log(arr.myMap(shout));

Array.prototype.myReduce = function(cb, initialValue) {
  let acc = initialValue;
  let array = this.slice();

  if (!initialValue) {
    acc = this[0];
    array.shift();
  }

  array.myEach(ele => {
    acc = cb(acc, ele);
  })

  return initial;
}

// array.higherOrder(function(ele) {
//   console.log(ele)
// })

// array.higherOrder(() => {
//   console.log("do something that doesn't involve passed in elements")
// })

// array.higherOrder(callBackFunction(ele))

// // without initialValue
// val1 = [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }); // => 6
// console.log(val1);

// // with initialValue
// val2 = [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }, 25); // => 31
// console.log(val2);