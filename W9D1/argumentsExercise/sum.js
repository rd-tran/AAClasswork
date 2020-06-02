function sumArguments() {
  let total = 0;

  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }

  return total;
}

function sumRest(...args) {
  let total = 0;

  for (let i = 0; i < args.length; i++) {
    total += args[i];
  }

  return total;
}

console.log(sumArguments(1, 2, 3, 4) === 10);
console.log(sumArguments(1, 2, 3, 4, 5) === 15);

console.log(sumRest(1, 2, 3, 4) === 10);
console.log(sumRest(1, 2, 3, 4, 5) === 15);