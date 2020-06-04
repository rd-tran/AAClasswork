const View = require('./ttt-view.js')
const Game = require('../node_solution/game.js')

  $(() => {
    const game = new Game();
    const view = new View(game, $('.ttt'));

    const $ul = $('ul');
    $ul.css('display', 'flex');
    $ul.css('width', 310);
    $ul.css('flex-wrap', 'wrap');

    const $li = $('li');
    $li.css('list-style-type', 'none');
    $li.css('display', 'flex');
    $li.css('justify-content', 'center');
    $li.css('align-items', 'center');
  });