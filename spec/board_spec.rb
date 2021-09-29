require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe Board do
    describe '#update_board' do
        subject(:board_update) { described_class.new}

        context 'when move is 3 and marker is X' do
            it 'changes grid[2] to X' do
                move = 3
                marker = "X"
                expect{board_update.update_board(move,marker)}.to change { board_update.grid[2] }.to("X")
            end
        end
    end
    
    describe '#has_won?' do
        
        let (:winning_player) { instance_double(Player, marker: "X")}

        context 'when the whole top row contains one marker' do
            
            subject(:game_top_row) { described_class.new(["X","X","X",4,5,6,7,8,9])}
            
            it 'returns true' do
                expect(game_top_row.has_won?(winning_player)).to be true
            end    
        end

        context 'when a whole diagonal row contains one marker' do
            
            subject(:game_diagonal) { described_class.new(["X", 2, 3, 4, "X", 6, 7, 8, "X"])}

            it 'returns true' do
                expect(game_diagonal.has_won?(winning_player)).to be true
            end
        end

        context 'when a whole column contains one marker' do
            
            subject(:game_column) { described_class.new(["X", 2, 3, "X", 5, 6, "X", 8, 9])}

            it 'returns true' do
                expect(game_column.has_won?(winning_player)).to be true
            end
        end

        context 'when no player has marked three squares in a row' do
            
            subject(:game_not_over) { described_class.new(["X", 2, "X", 4, 5, "X", 7, "X", 9])}

            it 'returns false' do
                expect(game_not_over.has_won?(winning_player)).to be false
            end
        end
    end

    describe '#is_full?' do

        context 'when the board is full' do
            
            subject(:board_full) { described_class.new(["X", "O", "O", "X", "X","O","O", "X", "O"])}

            it 'returns true' do
                expect(board_full.is_full?).to be true
            end
        end

        context 'when the board is not full' do
            
            subject(:board_not_full) { described_class.new(["X", 2, 3, 4, 5, 6, 7, 8, 9])}

            it 'returns false' do
                expect(board_not_full.is_full?).to be false
            end
        end
    end

    describe '#is_available?' do
        subject(:board_available) { described_class.new([1, "X", 3, 4, 5, 6, 7, 8, 9])}
                
        context 'when a move is taken' do
            it 'returns false' do
                move = 2
                expect(board_available.is_available?(move)).to be false
            end
        end

        context 'when a move is not taked' do
            it 'returns true' do
                move = 3
                expect(board_available.is_available?(move)).to be true
            end
        end
    end       
end