import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

export default class Game extends React.Component {
  constructor() {
    super();
    this.state = { board: new Minesweeper.Board(9, 10) };
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag()
    } else {
      tile.explore()
    }

    this.setState({board: this.state.board})
  }

  restartGame() {
    this.setState({ board: new Minesweeper.Board(9, 10)})
  }
  
  render() {
    let message;
    let className;

    if (this.state.board.lost()){
      message = "You Lost!"
      className = "is-open"
    } else if (this.state.board.won()){
      message = "You Won!"
      className = "is-open"
    }

    return (
      <>
        <Board board={this.state.board} updateGame={this.updateGame} />
        <section className={"modal " + className}>
            <div> {message} 
              <button onClick={this.restartGame}>Play Again</button>
            </div>
        </section>
      </>
    );
  }
}