require_relative "./card"
require_relative "./guess"
require_relative "./deck"
require "pry"

class Round
  attr_reader :deck
  attr_accessor :guesses, :counter

  def initialize(deck)
    @deck = deck
    @guesses = []
    @counter = 0
  end

  def current_card
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

  def start
    deck_start = deck.count
    puts ""
    puts "Welcome! You're playing with #{deck.count} cards.\n"
    puts "-------------------------------------------------\n"

    until deck.count == 0
    puts "This is card number #{(deck_start - deck.count) + 1} out of #{deck_start}"
    card = current_card
    puts card.question
    puts ""
    guess = Guess.new(gets.chomp, card)
    puts ""
    record_guess(guess)
    puts guess.feedback
    puts ""
    puts "You currently have #{number_correct} correct answer(s) with an accuracy of %#{percent_correct}"
    puts "-------------------------------------------------\n"
    end

    puts "****** GAME OVER!!! ******\n"
    puts ""
    puts "You had #{number_correct} out of #{deck_start} for a score of %#{percent_correct}"
    puts ""
  end

end
