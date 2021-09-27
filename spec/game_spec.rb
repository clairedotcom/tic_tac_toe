require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe Game do
    describe '#solicit_move' do
        subject(:game_input) { described_class.new}
        
        context 'when input is a string with a number between 1 and 9' do
            before do
                valid_input = "3"
                allow(game_input).to receive(:gets).and_return(valid_input)
            end

            it 'returns 3' do
                error_message = "Invalid input. Please enter a number between 1 and 9."
                expect(game_input).not_to receive(:puts).with(error_message)
                game_input.solicit_move
            end
        end

        context 'when input is a letter' do
           before do
                letter = 'r'
                valid_input = '5'
                allow(game_input).to receive(:gets).and_return(letter, valid_input)
           end
           
           it 'returns error message once' do
            error_message = "Invalid input. Please enter a number between 1 and 9."
            expect(game_input).to receive(:puts).with(error_message).once
            game_input.solicit_move
           end
        end
    end
end