function range(start, end) {
  if (start >= end) {    
    return [];
  }

  // My solution
  // return [start].concat(range(start + 1, end)); 

  // Their solution
  arr = range(start, end - 1);
  arr.push(end - 1);
  return arr
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

function fibonacci(n) {
    // My base case
    // if (n === 1) {
    //   return [1];
    // } else if (n === 2) {
    //   return [1,1]; 
    // } else if (n < 1) {
    //   return [];
    // }

    // Solutions base case
    if (n < 3) {
      return [1, 1].slice(0, n)
    }

    let fibSeries = fibonacci(n - 1);
    let prevFib = fibSeries[fibSeries.length - 1];
    let prevFib2 = fibSeries[fibSeries.length - 2];

    fibSeries.push(prevFib + prevFib2);
    return fibSeries;
}

// console.log(fibonacci(5));

function deepDup(arr) {
  // My way
  // let duplicates = [];

  // for (let i = 0; i < arr.length; i++) {
  //   let ele = arr[i];
  //   if (ele instanceof Array) {
  //     let subArr = deepDup(ele);
  //     duplicates.push(subArr);
  //   } else {
  //     duplicates.push(ele);
  //   }
  // }
  // return duplicates;

  // Solutions
  if (!(arr instanceof Array)) {
    return arr;
  }

  return arr.map(el => {
    return deepDup(el);
  })
}

// console.log(deepDup([1,2,[1,[2,3]]]));

function bsearch(nums, target, start = 0, end = nums.length) {
  if (nums.length === 0 || target < nums[0] || target > nums.slice(-1)) {
    return -1;
  }

  mid = Math.floor((end - start) / 2) + start;
  midEle = nums[mid];

  if (target === midEle) {
    return mid;
  } else if (target < midEle) {
    return bsearch(nums, target, start, mid - 1);
  } else if (target > midEle) {
    return bsearch(nums, target, mid + 1, end);
  }
}

// console.log(bsearch([0,1,2,3,4,5,6,7], 4));