require "spec_helper"

module Hangman
  RSpec.describe Letter do
    let(:letter) { Letter.new("a") }

    describe "#initialize" do
      it "raises an Argument Error if no value is passed" do
        expect{ Letter.new }.to raise_error(ArgumentError)
      end

      it "sets guessed to false by default" do
        expect(letter.guessed).to be false
      end
    end

    describe "#value" do
      it "returns the correct value" do
        expect(letter.value).to eq "a"
      end
    end
  end
end
