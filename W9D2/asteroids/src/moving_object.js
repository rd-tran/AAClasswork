function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    let newPos =[this.pos[0], this.pos[1]];
    [this.pos[0], this.pos[1]] = this.game.wrap(newPos);
}

MovingObject.prototype.isCollidedWith = function(otherObj) {
  let radiiSum = this.radius + otherObj.radius;
  let distanceBtwn = Math.sqrt(
    (this.pos[0] - otherObj.pos[0]) ** 2 + (this.pos[1] - otherObj.pos[1]) ** 2
  );

  return distanceBtwn < radiiSum - 1;
}

MovingObject.prototype.collideWith = function (otherObject) {
  // this.game.remove(this);
  // this.game.remove(otherObject);
}

module.exports = MovingObject;