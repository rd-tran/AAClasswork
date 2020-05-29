let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const grid = [];

  for (let i = 0; i < 8; i++) {
    grid.push(new Array(8));
  }

  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece('black');
  grid[3][3] = new Piece('white');
  grid[4][4] = new Piece('white');

  return grid;
}

// function _makeGrid () {
//   let grid = [];
//   let row = '_'.repeat(8).split('');

//   for (let i = 0; i < 8; i++) {
//     grid.push(row);
//   }

//   grid[3][4] = new Piece('black');
//   grid[4][3] = new Piece('black');
//   grid[3][3] = new Piece('white');
//   grid[4][4] = new Piece('white');

//   return grid;
// }

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if (pos[0] < 0 || pos[0] > 7 || pos[1] > 7 || pos[1] < 0) {
    return false;
  } else {
    return true;
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  return this.grid[pos[0]][pos[1]];
};

// Board.prototype.getPiece = function (pos) {
//   let piece = this.grid[pos[0]][pos[1]]
//   return piece === '_' ? undefined : piece
// };

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.getPiece(pos)) {
    return this.getPiece(pos).color === color;
  } else {
    return undefined;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.getPiece(pos) ? true : false;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip=[]){
  let nextPos = [pos[0]+ dir[0], pos[1]+dir[1]];

  if (!this.isValidPos(nextPos)) {
    return [];
  } else if (!this.isOccupied(nextPos)) {
    return [];
  } else if (this.isMine(nextPos, color)) {
    return piecesToFlip;
  } else {
    piecesToFlip.push(nextPos);
    return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  return Board.DIRS.some( dir => {
    return this._positionsToFlip(pos, color, dir).length !== 0;
  });
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (this.validMove(pos, color) && !this.isOccupied(pos)) {
    this.grid[pos[0]][pos[1]] = new Piece(color);
  } else {
    throw new Error('Invalid Move');
  }

  let arr = [];

  Board.DIRS.forEach( dir => {
    let result = this._positionsToFlip(pos, color, dir);

    if (result.length !== 0) {
      arr.push(...result);
    }
  });

  arr.forEach( pos => {
    piece = this.getPiece(pos);
    piece.flip();
  });
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validMovesPos = [];

  for (let row = 0; row < this.grid.length; row++) {
    for (let col = 0; col < this.grid.length; col++) {
      let pos = [row, col];

      if (!this.isOccupied(pos) && this.validMove(pos, color)) {
        validMovesPos.push(pos);
      }
    }
  }

  return validMovesPos;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove('black') && !this.hasMove('white');
};



/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < 8; i++) {
    let row = '';

    for (let j = 0; j < 8; j++) {
      piece = this.getPiece([i, j]);
      row += piece ? ` ${piece.toString()} ` : ' . ';
    }

    console.log(`${i} |` + row + `| ${i}`);
  }

  footer = [...Array(8).keys()].join('  ');
  console.log(`  ${'-'.repeat(26)}`);
  console.log(`    ${footer}`);
}



module.exports = Board;
