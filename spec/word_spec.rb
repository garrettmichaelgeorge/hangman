require "spec_helper"

module Hangman
  RSpec.describe Word do
    let(:word) { Word.new("implicit") }

    describe "#initialize" do
      it "is between 5 and 12 characters long by default" do
        word = Hangman::Word.new
        expect(word.length.between?(5, 12)).to be true
      end

      it "creates a thing for each letter" do
        letters_count = word.letters.size
        expect(word.length).to eq letters_count
      end

      it "stores the letters in the correct order" do
        letters = word.letters.map(&:value)
        expected = word.value.chars
        expect(letters).to eql expected
      end
    end

    describe "#current_state" do
      it "returns all blanks by default" do
        message = "_" * word.length
        expect(word.current_state).to eq message
      end
    end

    describe "#get_matching_letters" do
      it "returns an array with the correct number of matched objects" do
        expect(word.get_matching_letters("i").size).to eq 3
      end
    end

    describe "#update_guessed_status" do
      it "sets the matched letters' guessed status to true if a match is found" do
        matched_letter = word.letters.first
        allow(word).to receive(:get_matching_letters).and_return [matched_letter]
        expect do
          word.update_guessed_status("foo") 
        end.to change { matched_letter.guessed }.from(false).to(true)
      end
    end

    describe "#get_remaining_letters" do
      it "returns an empty array when all letters have been guessed correctly" do
        word.letters.each { |letter| letter.guessed = true }
        expect(word.get_remaining_letters).to be_empty
      end

      it "returns the remaining letters when there are some remaining" do
        expect(word.get_remaining_letters).not_to be_empty
      end

      it "returns all remaining letters at the beginning of the game" do
        word = Word.new
        expect(word.get_remaining_letters.size).to eq word.length
      end
    end

  end
end
