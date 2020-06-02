function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// Function.prototype.curry = function(numArgs) {
//     let numbers = [];
//     let func = this;

//     function _curry() {
//         let num = arguments[0];
//         numbers.push(num);

//         if (numbers.length === numArgs) {
//             return func.apply(null, numbers);
//         } else {
//             return _curry;
//         }
//     }

//     return _curry;
// }

Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let func = this;

  function _curry(num) {
      numbers.push(num);

      if (numbers.length === numArgs) {
        return func(...numbers);
      } else {
        return _curry;
      }
  }

  return _curry;
}

let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
console.log(f1);

// or more briefly:
// console.log('Function#curry() result:')
// console.log(sumThree.curry(3)(4)(20)(6)); // == 30