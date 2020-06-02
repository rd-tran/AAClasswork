function curriedSum(numArgs) {
  let numbers = [];

  function _curriedSum(number) {
    numbers.push(number);

    if (numbers.length === numArgs) {
      let total = 0;
      
      for (let i = 0; i < numbers.length; i++) {
        total += numbers[i];
      }

      return total;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

const sum = curriedSum(4);
console.log('curriedSum() result:');
console.log(sum(5)(30)(20)(1)); // => 56