class Board
    WINS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    attr_accessor :grid
    
    def initialize
        @grid = [1,2,3,4,5,6,7,8,9]
    end

    def display_board
        row_one = "#{grid[0]} | #{grid[1]} | #{grid[2]}"
        row_two = "#{grid[3]} | #{grid[4]} | #{grid[5]}"
        row_three = "#{grid[6]} | #{grid[7]} | #{grid[8]}"
        puts "#{row_one}\n#{row_two}\n#{row_three}\n"
    end

    def update_board(move,marker)
       @grid[move-1] = marker   
    end    
    
    def has_won?(player)
        WINS.any? do |combo|
            combo.all? {|position| @grid[position] == player.marker}
        end
    end
    
    def is_available?(move)
        @grid[move-1].is_a? Integer
    end 
    
    def is_full?
        @grid.all? {|cell| cell.is_a? String}
    end    

end    