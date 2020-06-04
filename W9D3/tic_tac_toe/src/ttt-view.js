class View {
  constructor(game, $el) {
    this.game = game;
    // this.gameBoard = $el;
    let $ul = this.setupBoard();
    $el.append($ul);

    // Bind the click event
    this.bindEvents();
  }

  bindEvents() {
    $('li').on('click', () => {
      let $li = $(event.target);
      
      this.makeMove($li);
      if (this.game.isOver()) $('li').off();
    });

  }
  
  makeMove($square) {
    let pos = $square.data('pos');

    // Place the mark
    if (this.game.board.isEmptyPos(pos)) {
      let mark = this.game.currentPlayer;
      $square.html(mark);
      if (mark === 'x'){
        $square.addClass('x');
      } else {
        $square.addClass('o');
      }

      $square.addClass('clicked');
    }
    
    // Make the move in js logic
    this.game.playMove(pos);

    // Display winners/losers
    if (this.game.isOver()){
      const winner = this.game.winner();
      $('li').addClass('loser');

      if (winner) {
        $(`li.${winner}`).removeClass('loser');
        $(`li.${winner}`).addClass('winner');

        const $h1 = $('<h1>').text(`You win, ${winner}!`);
        $(".ttt").append($h1);
      } else {
        const $h1 = $('<h1>').text("It's a tie!");
        $(".ttt").append($h1);
      }
      
      $('.hidden-button').removeClass('hidden-button');
    }
  }

  setupBoard() {
    let $ul = $('<ul>');
    
    for (let i = 0; i < 3; i++){
      for (let j = 0; j < 3; j++) {
        let $li = $('<li>');
        $li.data('pos', [i, j]);
        $ul.append($li);
      }
    }



    return $ul;
  }
}

module.exports = View;
