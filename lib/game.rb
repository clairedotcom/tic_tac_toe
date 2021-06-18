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
        board = @board
        puts say_random_player
        randomize_first_player
        play_game(board)
        #board.display_board
        #move = solicit_move
        #make_move(move,@current_player.marker,board)
        #board.display_board
        #switch_player
        #move = solicit_move
        #make_move(move,@current_player.marker,board) 
        #board.display_board
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
    
    #switch current player
    def switch_player
        if @current_player == @human_player
            @current_player = @computer_player
        elsif @current_player == @computer_player
            @current_player = @human_player
        end
    end

    #wrap checking if it's available into a method
    def make_move(a,b,board)
        if board.is_available?(a)
            board.update_board(a,b)
        else
            puts "That move is already taken. Please select another square."
            solicit_move
        end
    end
    
    #make a method that checks for whens
    #make an until loop
    def play_game(board)
        until board.has_won?(@current_player) do
            move = solicit_move
            board.update_board(move,@current_player.marker)
            board.display_board
            switch_player
        end 
    end       
    #loop through solicit move, update board, switch user until (or unless?)win is true
end 