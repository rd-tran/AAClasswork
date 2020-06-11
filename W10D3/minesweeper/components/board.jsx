import React from 'react'
import Tile from './tile'

export default class Board extends React.Component {
  constructor(props){
    super(props);
  }

  render(){ 
    const grid = this.props.board.grid
    const fn = this.props.updateGame
    return(
      <>
        {
          grid.map((row, idx) => {
            return (
              <div className="row" key={idx}>
                {
                  row.map((ele, idx2) => {
                    return (
                      <Tile tile={ele} updateGame={fn}/>
                    )
                  })
                }
              </div>
            );
          })
        }
      </>
    )
  }
}
