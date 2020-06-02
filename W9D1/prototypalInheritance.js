Function.prototype.inherits = function (superclass) {
    function Surrogate () {};
    Surrogate.prototype = superclass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
} 

function Animal (name) {
    this.name = name;
}

function Dog (name) {
    Animal.call(this,name);
    this.species = "DOG";
}

Dog.inherits(Animal);

Animal.prototype.greet = function() {
    console.log("Hi, my name is", this.name);
}

let dog = new Dog('Fido');
dog.greet();
console.log(Dog.prototype.__proto__ === Animal.prototype);
console.log(Dog.prototype.constructor);

function Cat(name) {
    Animal.call(this,name);
    this.species = 'Cat';
}

Cat.prototype = Object.create(Animal.prototype);
Cat.prototype.constructor = Cat;

let cat = new Cat('Betty');
cat.greet();
console.log(Cat.prototype.__proto__ === Animal.prototype);
console.log(Cat.prototype.constructor);
