import React from 'react';

export default class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    if (event.altKey) {
      this.props.updateGame(this.props.tile, true);
    } else {
      this.props.updateGame(this.props.tile, false);
    }
  }

  render() {
    const tile = this.props.tile;
    let renderTile;
    let renderClass;

    if (tile.explored) {
      if (tile.bombed) {
        renderClass = 'clicked bombed';
        renderTile = '💣';
      } else if (tile.adjacentBombCount()) {
        renderClass = 'clicked';
        renderTile = tile.adjacentBombCount();
      } else {
        renderClass = 'clicked';
        renderTile = '';
      }
    } else if (tile.flagged) {
      renderClass = 'clicked flagged';
      renderTile = '🇺🇸';
    } else {
      renderClass = 'unclicked';
      renderTile = '';
    }

    return (
      <div
        className={"tile " + renderClass}
        key={tile.pos}
        onClick={this.handleClick}>{renderTile}</div>
    );
  }
}