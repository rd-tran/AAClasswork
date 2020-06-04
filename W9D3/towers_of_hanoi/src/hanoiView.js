class HanoiView {
    constructor(game, rootEl){
        this.game = game;
        this.rootEl = rootEl;
        this.setUpTowers();
    }

    setUpTowers(){
        for (let i = 0; i < 3; i++){
            let $ul = $('<ul>');
            $ul.data('tower', i);

            for (let j = 0; j < 3; j++) {
                let size = this.game.towers[i][j]
                let $li = $('<li>');

                switch (size) {
                  case 1 :
                    $li.addClass('small');
                    break;
                  case 2 :
                    $li.addClass('medium');
                    break;
                  case 3 :
                    $li.addClass('large');
                    break;
                }
                $ul.append($li);
            }
            this.rootEl.append($ul);
        }
    }

    render() {

    }
}

module.exports = HanoiView;