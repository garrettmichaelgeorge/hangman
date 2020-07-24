module Hangman
  class Word
    attr_reader :value
    attr_accessor :letters

    def initialize(word = default_word)
      @value = word
      @letters = define_letters_for word
    end

    def length
      value.length
    end

    def current_state
      letters.map { |letter| letter.guessed ? letter.value : "_" }.join("")
    end

    def get_matching_letters(string)
      letters.select { |letter| letter.value == string }
    end

    def update_guessed_status(letter)
      matching_letters = get_matching_letters(letter)
      return false if matching_letters.empty?

      matching_letters.each { |letter| letter.guessed = true }
    end

    def get_remaining_letters
      self.letters.reject { |letter| letter.guessed }
    end

    private

    def define_letters_for word
      letters = []
      word.each_char { |char| letters << Letter.new(char) }
      return letters
    end

    def default_word
      DICTIONARY.sample
    end
  end
end

