require_relative "spec_helper.rb"

module Hangman
  RSpec.describe Hangman do
    it "has a version number" do
      expect(VERSION).not_to be nil
    end

    it "loads the dictionary" do
      expect(DICTIONARY.empty?).to be false
    end
  end
end
