module Hangman
  class Message
    # Define all UI messages here

    class << self
      def begin_game
        "Begin game"
      end

      def victory
        "Congratulations, you won!"
      end

      def defeat
        "Hangman!"
      end

      def quit
        "Exiting..."
      end

      def play_again
        "Play again?"
      end

      def solicit_user_input
        "Your move: "
      end

      def incorrect_guesses(incorrect_guesses)
        "#{incorrect_guesses} incorrect guesses"
      end
    end
  end
end

