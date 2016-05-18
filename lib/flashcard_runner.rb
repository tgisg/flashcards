require_relative "./card"
require_relative "./guess"
require_relative "./deck"
require_relative "./round"
require "pry"

card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("What is Mike's last name?", "Dao")
card_3 = Card.new("On which street is Turing located?", "Blake")
card_4 = Card.new("How many days are in a week?", "7")
card_5 = Card.new("How many inches are in a foot?", "12")
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
round = Round.new(deck)

deck_start = deck.count
puts ""
puts "Welcome! You're playing with #{deck.count} cards.\n"
puts "-------------------------------------------------\n"

until deck.count == 0
puts "This is card number #{(deck_start - deck.count) + 1} out of #{deck_start}"
card = round.current_card
puts card.question
puts ""
guess = Guess.new(gets.chomp, card)
puts ""
round.record_guess(guess)
puts guess.feedback
puts ""
puts "You currently have #{round.number_correct} correct answer(s) with an accuracy of %#{round.percent_correct}"
puts "-------------------------------------------------\n"
end

puts "****** GAME OVER!!! ******\n"
puts ""
puts "You had #{round.number_correct} out of #{deck_start} for a score of %#{round.percent_correct}"
puts ""
