/** range(start, end)
 * receives a start and end value,
 * returns an array from start up to end
 * 
 * range(0, 1) === [0]
 * range(0, 2) === [0, 1]
 * range(0, 3) === [0, 1, 2]
 * base
 */
function range(start, end) {

    if (start >= end) {    
        return [];
    }                                                                           //range(0,3) range(1,3) range(2,3) range(3,3)
    
    return [start].concat(range(start + 1, end));                               //range(2,3) range(3,3)   
}

// console.log(range(0, 3));

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }

  return arr[0] + sumRec(arr.slice(1));
}

// console.log(sumRec([1,2,3,4,5]));

function exponent(base, exp) {
  if (exp === 0) return 1;

  return base * exponent(base, exp - 1);
}

// console.log(exponent(2, 5));

function exponent2(base, exp) {
  if (exp === 1) {
    return base;
  } else if (exp === 0) {
    return 1;
  }

  if (exp % 2 === 0) {
    return exponent2(base, exp / 2) ** 2;
  } else {
    return base * (exponent2(base, (exp - 1) / 2) ** 2);
  }
}

// console.log(exponent2(2, 5));

/**
 * 1 1 2 3 5 8 13
 * 
 */
function fibonacci(n) {
    if (n === 1) {
        return [1];
    } else if (n === 2) {
        return [1,1]; 
    } else if (n < 1) {
        return [];
    }

    let fibSeries = fibonacci(n - 1);
    let prevFib = fibSeries[fibSeries.length - 1];
    let prevFib2 = fibSeries[fibSeries.length - 2];
    fibSeries.push(prevFib + prevFib2);
    return fibSeries;
}

// console.log(fibonacci(5));

function deepDup(arr) {
    let duplicates = [];

    for (let i = 0; i < arr.length; i++) {
        let ele = arr[i];
        if (ele instanceof Array) {
            let subArr = deepDup(ele);
            duplicates = duplicates.concat(subArr);
        } else {
            duplicates.push(ele);
        }
    }
    return duplicates;
}

/**
 * duplicates = []
 * [1, [2,3]]
 * duplicates = [1]
 * duplicates = [1, [2,3]]
 * 
 * duplicates = []
 * [2,3]
 * duplicates = [2,3]
 */

console.log(deepDup([1,2,[1,[2,3]]]));