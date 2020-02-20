import React from 'react';
import Tile from './tile';

// export default class Board extends React.Component {
//   constructor(){}
// }

const Board = (props) => {
  // debugger;
  const rows = props.board.grid.map((row, i) => {
    return(
      <div className="row" key={i}>{
      row.map((ele, j) => {
        return (
          <Tile tile = {ele} key={j} />
        )
      })
    }</div>
    )
  })
  return rows;
}

export default Board;