require_relative "hangman/version.rb"

module Hangman
  DICTIONARY = IO.readlines("dictionary.txt").map(&:strip).select { |word| word.length.between?(5, 12)}
end

require_relative "hangman/message.rb"
require_relative "hangman/row.rb"
require_relative "hangman/game.rb"
require_relative "hangman/word.rb"
require_relative "hangman/letter.rb"
require_relative "hangman/player.rb"
