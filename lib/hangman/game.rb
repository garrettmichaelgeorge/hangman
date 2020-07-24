module Hangman
  class Game
    attr_reader :player
    attr_accessor :word, :guesses, :incorrect_guesses

    def initialize(player, word: Word.new, guesses: 0, incorrect_guesses: 0)
      @player = player
      @word = word
      @guesses = guesses
      @incorrect_guesses = incorrect_guesses
    end

    def check_guess(guess)
      exit if guess == "exit"

      self.guesses += 1

      correct_guess?(guess) ? correct_result(guess) : incorrect_result
    end

    def check_game_over
      return :victory if victory?
      return :defeat if defeat?

      false
    end

    def play
      puts Message.begin_game

      while true
        puts word.current_state
        puts Message.incorrect_guesses(incorrect_guesses)
        p Message.solicit_user_input
        guess = get_guess
        check_guess(guess)

        if check_game_over
          puts word.current_state
          exit
        end
        puts
      end
    end

    def game_over_message
      case check_game_over
      when :victory
        Message.victory
      when :defeat
        Message.defeat
      else
        Message.quit
      end
    end

    private

    def victory?
      self.word.get_remaining_letters.empty?
    end

    def defeat?
      self.incorrect_guesses >= 6
    end

    def correct_result(guess)
      word.update_guessed_status(guess)
      return true
    end

    def incorrect_result
      self.incorrect_guesses += 1
      return false
    end

    def correct_guess?(guess)
      !word.get_matching_letters(guess).empty? # condition for correct guess
    end

    def get_guess(input = gets.chomp)
      input
    end
  end
end

