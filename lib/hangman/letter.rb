module Hangman
  class Letter
    attr_reader :value
    attr_accessor :guessed

    def initialize(value)
      @value = value
      @guessed = false
    end

    def guessed?
      self.guessed == true
    end

    def unguessed?
      !guessed?
    end
  end
end
