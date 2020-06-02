export default class Bird {
    constructor(dimmesions) {
        this.width = dimmesions.width;
        this.height = dimmesions.height;
        this.yPos = this.height / 2
        this.xPos = this.width / 3
    }

    drawBird (ctx) {
      ctx.fillStyle = "yellow";
      ctx.fillRect(this.xPos, this.yPos, 40, 30);
    }
}