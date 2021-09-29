class Game
    def initialize(board = Board.new)
        @board = board
        @computer_player = Player.new("Computer","X")
        @human_player = Player.new("Human","O")
        @current_player = randomize_first_player
    end
    
    def play
        greeting
        
        until game_over? do
            break if draw?
            turn
            switch_player
        end
    end   

    def randomize_first_player
        rand(2) == 1 ? @current_player = @computer_player : @current_player = @human_player
    end

    def game_over?
        return true if @board.has_won?(@human_player) || @board.has_won?(@computer_player)
    end 
    
    def draw?
        if @board.is_full?
            puts "It's a draw!"
            return true
        end    
    end    
    
    def turn
        if @current_player == @human_player
            puts "Please enter a number between 1 and 9 to move.\n"
            move = solicit_move 
        end

        move = computer_move if @current_player.name == @computer_player.name
        
        puts "#{@current_player.name} selects #{move}."
        
        @board.update_board(move, @current_player.marker)
        @board.display_board

        puts "#{@current_player.name} has won!" if game_over?
    end    
    
    def switch_player
        @current_player == @human_player ? @current_player = @computer_player : @current_player = @human_player
    end

    def solicit_move
        loop do
            user_input = gets.chomp
            integer_input = user_input.to_i
            
            return integer_input if valid_input?(integer_input) && @board.is_available?(integer_input)

            if @board.is_available?(integer_input) == false
                puts "That square is taken. Please select another one: "
            else
                puts "Invalid input. Please enter a number between 1 and 9."
            end
        end
    end

    def valid_input?(input)
        return true if input > 0 && input < 10
        return false
    end
    
    def computer_move
        move = rand(1..9)
        until @board.is_available?(move) do 
            move = rand(1..9)
        end    
        return move
    end

    private

    def greeting
        puts "Welcome to Tic Tac Toe!"
        puts "We will randomly choose which player goes first.\n"
        puts "#{@current_player.name} will go first.\n"
        @board.display_board
    end

end 