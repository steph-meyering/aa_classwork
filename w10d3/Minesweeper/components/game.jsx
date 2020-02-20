import * as Minesweeper from '../minesweeper';
import React from 'react';
import Board from './board';

export default class Game extends React.Component {

  constructor(){
    super();
    this.updateGame = this.updateGame.bind(this);
    this.state = {
      board: new Minesweeper.Board(9, 5)
    }
  }
  
  updateGame(){}

  render(){
    return(
    <div className="main">
      <Board board = {this.state.board} />
    </div>
    )};
}