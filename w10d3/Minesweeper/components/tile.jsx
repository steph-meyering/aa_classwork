import React from 'react';
import Minesweeper from '../minesweeper'

export default class Tile extends React.Component {
  constructor(props){
    // debugger;
    super(props);
    // this.bombed = props.tile.bombed;
    // this.explored = props.tile.explored;
    // this.flagged = props.tile.flagged;
  }
  render(){
    // debugger
    let tile = this.props.tile;
    let icon = '';
    let numBombs = 0;
    if(tile.bombed){
      // debugger
      icon = '💣';
    } else if(tile.explored){
      // debugger
      icon = numBombs;
    } else if(tile.flagged){
      // debugger
      icon = '🚩';
    } 
    return <div className="tile">{icon}</div>;
  }

  handleClick() {
    this.updateGame(this)
  }
}

