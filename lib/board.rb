class Board
    attr_reader :grid
    
    def initialize
        @grid = [
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]
    end

    def display_board
        row_one = "#{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]}"
        row_two = "#{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]}"
        row_three = "#{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]}"
        puts "#{row_one}\n#{row_two}\n#{row_three}"
    end    
end    