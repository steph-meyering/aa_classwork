require_relative 'board.rb'

b = Board.new
# p b

# p b.valid_pos?([9,9])
# p b.valid_pos?([0,1])

b.populate_blank_pieces

# p b[[0,0]]
# b.move_piece([0, 2], [0, 1])
# p b

k = King.new(nil, [2,2])
p k.moves