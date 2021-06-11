require_relative "player.rb"
require_relative "board.rb"
require_relative "game.rb"
require_relative "dialogue.rb"

include Dialogue

puts greeting
test = Board.new
test.display_board
puts randomize_first_player


