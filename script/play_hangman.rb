require_relative "../lib/hangman.rb"

bob = "bob"
game = Hangman::Game.new(bob)

at_exit do
  puts game.game_over_message
end

game.play
