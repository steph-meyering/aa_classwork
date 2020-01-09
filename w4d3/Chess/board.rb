require_relative 'piece.rb'
require 'byebug'

class Board 
  attr_reader :rows

 

  def initialize
    # @sentinel = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, nil) }
  end

  def [](pos)
    x , y = pos
    @rows[x][y]
  end


  def []=(pos,val)
    x , y = pos
    @rows[x][y] = val
  end

  def populate_blank_pieces
    cols = [0,1,6,7]
    @rows.each_with_index do |row, i|
      cols.each do |col|
        self[[i, col]] = Piece.new(nil, nil)
      end
    end
  end

  def move_piece(start_pos, end_pos) #color arg to be added later
    # debugger
    raise 'no piece at start_pos' if self[start_pos].nil?
    raise 'piece cannot move to end_pos' if !self[end_pos].nil?  

    start_piece = self[start_pos] #piece_instance
    end_piece = self[end_pos] #nil
    #update the piece's position
    start_piece.pos = end_pos #updated piece pos
    
    #update the grid
    self[end_pos], self[start_pos] = self[start_pos], nil

  end

  def valid_pos?(pos)
    pos.all? { |el| (0..7).to_a.include?(el) }
  end

  def add_piece(piece, pos)

  end
  
  def checkmate?(color)

  end

  def in_check?(color)

  end

  def find_king(color)

  end

  def pieces
    
  end

  def dup
    
  end

  def move_piece!(color, start_pos, end_pos)

  end
end
