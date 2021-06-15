require_relative "dialogue.rb"

class Game
    include Dialogue
    
    attr_accessor :current_player, :computer_player, :human_player
    
    def initialize
        @board = Board.new
        @computer_player = Player.new("Human","X")
        @human_player = Player.new("Computer","O")
        @current_player = nil
    end
    
    #play method that walks through game steps
    #loop through until a player has won
    def play
        puts greeting
        board = Board.new
        puts say_random_player
        randomize_first_player
        board.display_board
        move = solicit_move
        board.update_board(move,@current_player.marker)
        board.display_board
    end    

    def randomize_first_player
        number = rand(2)
        if number == 1
            @current_player = @computer_player
            puts "#{@computer_player.name} will go first.\n"
        else
            @current_player = @human_player
            puts "#{@human_player.name} will go first.\n"
        end  
    end

    #solicit move from human player
    def solicit_move
        puts "Please enter a number between 1 and 9 to move."
        return gets.chomp.to_i
    end 
    
    #def set_move(a,b)
    #    board.update(a,b)
    #end    

end 