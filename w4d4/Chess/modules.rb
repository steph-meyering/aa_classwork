require 'singleton'


module Stepable
  # def move_diffs
  #   [[111,111]]
  # end

  def moves 
    x, y = self.pos
    move_diffs.map do |move| 
      a, b = move
      [a + x, y + b]
    end
  end
end

module Slideable
  HORIZONTAL_DIRS = [[0,1],[0,-1]]
  DIAGONAL_DIRS = [[-1,-1],[-1,1],[1,-1],[1,1]]


  
  def moves
    
  end
  
end


# HORIZONTAL_DIRS = horizontal_dirs
# VERTICAL_DIRS = horizontal_dirs.map(&:reverse)
# LDIAGONAL_DIRS = l_diagonal_dirs

# def horizontal_dirs
#   arr = []
#   y = 0
#   pos_x = (-7..7).to_a

#   pos_x.each do |x|
#     arr << [x , y]
#   end
#   arr.delete([0,0])
#   arr
# end

# def l_diagonal_dirs
#   arr = []
#   indices = (-7..7).to_a
#   indices.each { |i| arr << [i,i] }
#   arr.delete([0,0])
#   arr
# end

# def r_diagonal_dirs
#   arr = []
#   x = 7
#   y = -7
  
#   until x == -7
#     arr << [x, y]
#     x -= 1
#     y += 1
#   end

#   arr
# end

# startpos = [1,2]
# movediffs = [[1,2],[2,1]] 
# ==> [[2,4],[3,3]]

# x, y = startpos
# movediffs.map do |move|
#   a, b = move
#   []


