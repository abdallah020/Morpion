require_relative 'lib/app/Board'
require_relative 'lib/app/Player'
require_relative 'lib/app/Game'
require_relative 'lib/app/Show'
require_relative 'lib/app/BoardCase'

class Application
  def self.run
    puts "Bienvenu dans le jeu morpion!"
    loop do
      player1 = Player.new("Player 1", 'X')
      player2 = Player.new("Player 2", 'O')
      game = Game.new(player1, player2)
      game.play
      puts "Voulez-vous jouer encore? (y/n)"
      response = gets.chomp.downcase
      break unless response == 'y'
    end
    puts "Merci d'avoir jouer! Bye bye liki liki!"
  end
end

Application.run

