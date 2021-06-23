require_relative "dialogue.rb"

class Game
    include Dialogue
    
    attr_reader :board, :computer_player, :human_player
    
    def initialize
        @board = Board.new
        @computer_player = Player.new("Human","X")
        @human_player = Player.new("Computer","O")
    end
    
    def play
        puts greeting
        board = @board
        puts say_random_player
        current_player = randomize_first_player
        puts "#{current_player.name} will go first.\n"
        board.display_board
        until board.has_won?(@human_player) || board.has_won?(@computer_player) do
            
            move = solicit_move(current_player)
            puts "#{current_player.name} selects #{move}."
              if board.is_available?(move)
                board.update_board(move,current_player.marker)
              else
                puts "That move is already taken. Please select another square."
                solicit_move(current_player)
              end  
            board.display_board
            if board.has_won?(@human_player) || board.has_won?(@computer_player)
                puts "#{current_player.name} has won!"
            end    
            current_player = switch_player(current_player)
        end
        
    end   

    def randomize_first_player
        number = rand(2)
        if number == 1
            return @computer_player
        else
            return @human_player
        end
    end

    def solicit_move(current_player)
        if current_player.name == "Human"
            puts "Please enter a number between 1 and 9 to move."
            return gets.chomp.to_i
        else
            move = rand(9)
            until board.is_available?(move) do 
                move = rand(9)
            end
            return move    
        end        
    end
    
    def switch_player(current_player)
        (current_player == @human_player) ? @computer_player : @human_player
    end

    def computer_move
        return rand(9)   
    end    
end 