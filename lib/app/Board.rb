require_relative 'Game'
require_relative 'Player'

class Board
  WINNING_COMBINATIONS = [
    ['A1', 'A2', 'A3'], ['B1', 'B2', 'B3'], ['C1', 'C2', 'C3'],
    ['A1', 'B1', 'C1'], ['A2', 'B2', 'C2'], ['A3', 'B3', 'C3'],
    ['A1', 'B2', 'C3'], ['A3', 'B2', 'C1']
  ]

  def initialize
    @board = {}
    ('A'..'C').each do |row|
      (1..3).each do |col|
        @board["#{row}#{col}"] = ' '
      end
    end
  end

  def display_board
    puts "  1 2 3"
    ('A'..'C').each do |row|
      print "#{row} "
      (1..3).each do |col|
        print "#{@board["#{row}#{col}"]} "
      end
      puts
    end
  end

  def place_move(move, symbol)
    @board[move] = symbol if @board[move] == ' '
  end

  def game_over?
    winner? || draw?
  end

  def winner?
    WINNING_COMBINATIONS.any? do |combo|
      combo.all? { |position| @board[position] == 'X' } ||
      combo.all? { |position| @board[position] == 'O' }
    end
  end

  def draw?
    @board.none? { |_, value| value == ' ' }
  end

  def winner
    if winner?
      @board.values.include?('X') ? 'X' : 'O'
    else
      nil
    end
  end
end

# Main code to start the game
player1 = Player.new("Player 1", 'X')
player2 = Player.new("Player 2", 'O')
game = Game.new(player1, player2)
game.play
