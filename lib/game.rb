class Game
    def initialize(board = Board.new)
        @board = board
        @computer_player = Player.new("Human","X")
        @human_player = Player.new("Computer","O")
        @current_player = nil
    end
    
    def play
        greeting
        randomize_first_player
        
        until game_over? do
            break if draw?
            turn
            switch_player
        end
    end   

    def greeting
        puts "Welcome to Tic Tac Toe!"
        puts "We will randomly choose which player goes first.\n"
    end    
    
    def draw?
        if @board.is_full?
            puts "It's a draw!"
            return true
        end    
    end    
    
    def turn
        move = solicit_move
        puts "#{@current_player.name} selects #{move}."

        if @board.is_available?(move)
            @board.update_board(move,@current_player.marker)
        else
            puts "That move is already taken. Please select another square."
            move = solicit_move
            @board.update_board(move,@current_player.marker)
        end 

        @board.display_board

        if game_over?
            puts "#{@current_player.name} has won!"
        end
    end    
    
    def game_over?
        return true if @board.has_won?(@human_player) || @board.has_won?(@computer_player)
    end    
    
    def randomize_first_player
        rand(2) == 1 ? @current_player = @computer_player : @current_player = @human_player
        puts "#{@current_player.name} will go first.\n"
        @board.display_board
    end

    def solicit_move
        if @current_player.name == "Human"
            puts "Please enter a number between 1 and 9 to move."
            return gets.chomp.to_i
        else
            move = rand(1..9)
            until @board.is_available?(move) do 
                move = rand(1..9)
            end
            return move    
        end        
    end
    
    def switch_player
        @current_player == @human_player ? @current_player = @computer_player : @current_player = @human_player
    end   
end 