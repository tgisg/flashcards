require_relative "./card"
require_relative "./guess"
require_relative "./deck"
require "pry"

class Round
attr_reader :deck
attr_accessor :guesses
attr_accessor :counter

  def initialize(deck)
    @deck = deck
    @guesses = []
    @counter = 0
  end

  def current_card
    #I need to figure out how to bring the first card in the array to the fore and use it, and discard it.
    deck.cards.shift
  end

  def record_guess(guess)
    @guesses << guess
    guess
  end

  def number_correct
    counter = 0
    @guesses.map do |guess|
      if guess.response == guess.card.answer
        counter += 1
      end
    end
    counter
  end

  def percent_correct
    ((number_correct.to_f / @guesses.length.to_f) * 100)
  end
end
