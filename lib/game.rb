class Game
    def initialize
        @board = Board.new
        @computer_player = Player.new("human","X")
        @human_player = Player.new("computer","O")
    end
    
    def randomize_first_player
        number = rand(1)
        if number == 1
            player_one = computer_player
        else
            player_one = human_player
        end    
    end
    

    

end 