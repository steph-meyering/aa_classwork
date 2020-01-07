require_relative '00_tree_node.rb'

class KnightPathFinder
  def self.valid_moves?(pos)
    x, y = pos
    moves = []
    a = [1, -1]
    b = [2, -2]
    a.each do |i|
      b.each do |j|
        moves << [i, j]
        moves << [j, i]
      end
    end

    moves
  end

    def initialize(start_pos)
      @pos = start_pos
      @considered_positions = [start_pos]
    end
end

p KnightPathFinder.valid_moves?([3,3])