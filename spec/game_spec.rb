require "spec_helper"

module Hangman
  RSpec.describe Game do
    let(:bob) { Player.new("Bob") }
    let(:game) { Game.new(bob) }

    describe "#initialize" do
      it "raises an Argument Error if no players are provided" do
        expect { Game.new }.to raise_error(ArgumentError)
      end

      it "sets guesses to 0 by default" do
        expect(game.guesses).to eq 0
      end

      it "sets incorrect guesses to 0 by default" do
        expect(game.incorrect_guesses).to eq 0
      end
    end

    describe "#guesses=" do
      it "increments the number of guesses by one" do
        expect{ game.guesses += 1 }.to change(game, :guesses).by 1
      end
    end

    describe "#guesses" do
      it "returns the correct number of guesses" do
        game.guesses += 1
        expect(game.guesses).to eq 1
      end
    end

    describe "#check_guess" do
      it "increments the number of guesses by one" do
        allow(game).to receive(:correct_guess?).and_return true
        allow(game).to receive(:correct_result).and_return true
        expect{ game.check_guess("foo") }.to change(game, :guesses).by 1
      end

      it "returns true if at least one matching letter is found" do
        allow(game).to receive(:correct_guess?).and_return true
        allow(game).to receive(:correct_result).and_return true
        expect(game.check_guess("i")).to be true
      end

      it "returns false for an incorrect guess" do
        expect(game.check_guess("x")).to be false
      end

      it "increments the number of incorrect guesses by one if the guess was incorrect" do
        expect{ game.check_guess("false") }.to change(game, :incorrect_guesses).by 1
      end
    end

    describe "#check_game_over" do
      it "returns :victory if victory conditions are met" do
        allow(game.word).to receive(:get_remaining_letters).and_return []
        expect(game.check_game_over).to eq :victory
      end

      it "returns :defeat if victory conditions are not met and defeat conditions are" do
        allow(game.word).to receive(:get_remaining_letters).and_return ["remaining letter"]
        game.incorrect_guesses = 6
        expect(game.check_game_over).to eq :defeat
      end

      it "returns false if neither victory nor defeat conditions are met" do
        allow(game.word).to receive(:get_remaining_letters).and_return ["remaining letter"]
        game.incorrect_guesses = 5
        expect(game.check_game_over).to be false
      end
    end

    describe "#play" do
      before do
        allow(game).to receive(:get_guess).and_return "foo"
      end

      it "exits at victory" do
        allow(game).to receive(:check_game_over).and_return :victory
        expect{ game.play }.to raise_error(SystemExit)
      end

      it "exits at defeat" do
        allow(game).to receive(:check_game_over).and_return :defeat
        expect{ game.play }.to raise_error(SystemExit)
      end

      it "exits when the user inputs 'exit'" do
        allow(game).to receive(:get_guess).and_return "exit"
        expect{ game.play }.to raise_error(SystemExit)
      end
    end
  end
end
