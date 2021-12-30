# frozen_string_literal: true

class Board
  WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  attr_accessor :grid

  def initialize(grid = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @grid = grid
  end

  def display_board
    board = <<~DISPLAY

      #{grid[0]} | #{grid[1]} | #{grid[2]}
      ----------
      #{grid[3]} | #{grid[4]} | #{grid[5]}
      ----------
      #{grid[6]} | #{grid[7]} | #{grid[8]}

    DISPLAY

    puts board
  end

  def update_board(move, marker)
    @grid[move - 1] = marker
  end

  def win?(player)
    WINS.any? do |combo|
      combo.all? { |position| @grid[position] == player.marker }
    end
  end

  def available?(move)
    @grid[move - 1].is_a? Integer
  end

  def full?
    @grid.all? { |cell| cell.is_a? String }
  end
end
