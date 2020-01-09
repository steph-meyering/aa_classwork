require_relative 'modules.rb'


class Piece
  attr_accessor :pos

  def inspect
    p "PIECE"
  end

  def initialize(board, pos) #color arg to be added later
    # @color = color
    @board = board
    @pos = pos
  end
  


  
  
end

class Rook < Piece
  include Slideable
  @symbol = :Rook

end

class Bishop < Piece
  include Slideable
  @symbol = :Bishop
end

class Queen < Piece
  include Slideable
  @symbol = :Queen
end

class Knight < Piece
  include Stepable
  @symbol = :Knight

  protected
  def move_diffs 
    [[2, 1], [1, 2], [-2, 1], [-1, 2], [2, -1], [1, -2], [-2, -1], [-1, -2]]
  end
end

class King < Piece
  include Stepable
  @symbol = :King

  def move_diffs
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  end
end



class NullPiece < Piece
  include Singleton
end