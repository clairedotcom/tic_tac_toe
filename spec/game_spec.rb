# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do
  subject(:game_input) { described_class.new }

  describe '#solicit_move' do
    context 'when input is a string with a number between 1 and 9' do
      before do
        valid_input = '3'
        allow(game_input).to receive(:gets).and_return(valid_input)
      end

      it 'returns 3' do
        error_message = 'Invalid input. Please enter a number between 1 and 9.'
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
        error_message = 'Invalid input. Please enter a number between 1 and 9.'
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.solicit_move
      end
    end
  end

  describe '#valid_input?' do
    context 'when the input is 11' do
      it 'returns false' do
        invalid_input = 11
        expect(game_input.valid_input?(invalid_input)).to be false
      end
    end

    context 'when the input is between 1 and 9' do
      it 'returns true' do
        input = 3
        expect(game_input.valid_input?(input)).to be true
      end
    end
  end
end
