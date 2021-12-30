# frozen_string_literal: true

class Game
  def initialize(board = Board.new)
    @board = board
    @computer_player = Player.new('Computer', 'X')
    @human_player = Player.new('Human', 'O')
    @current_player = randomize_first_player
  end

  def play
    greeting

    until game_over?
      break if draw?

      turn
      switch_player
    end
  end

  def randomize_first_player
    @current_player = rand(2) == 1 ? @computer_player : @human_player
  end

  def game_over?
    return true if @board.win?(@human_player) || @board.win?(@computer_player)
  end

  def draw?
    if @board.full?
      puts "It's a draw!"
      true
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
    @current_player = @current_player == @human_player ? @computer_player : @human_player
  end

  def solicit_move
    loop do
      user_input = gets.chomp
      integer_input = user_input.to_i

      return integer_input if valid_input?(integer_input) && @board.available?(integer_input)

      if @board.available?(integer_input) == false
        puts 'That square is taken. Please select another one: '
      else
        puts 'Invalid input. Please enter a number between 1 and 9.'
      end
    end
  end

  def valid_input?(input)
    return true if input.positive? && input < 10

    false
  end

  def computer_move
    move = rand(1..9)
    move = rand(1..9) until @board.available?(move)
    move
  end

  private

  def greeting
    puts 'Welcome to Tic Tac Toe!'
    puts "We will randomly choose which player goes first.\n"
    puts "#{@current_player.name} will go first.\n"
    @board.display_board
  end
end
