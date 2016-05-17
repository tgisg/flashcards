#create cards
#put cards in deck
#create new round with aforementioned deck
#use method.start to start the round

#BEGIN REPL
#puts greeting to the user, including length of deck array
#Tell user which card they are at (current_card)
#puts card.question to screen
#gets user response
#puts user response to screen
#store user response
#check if user response is correct (guess.correct?)
#puts result of guess.correct?
#puts number_correct and percent_correct to the screen
#END REPL

#run current_card again, which should have already shifted card_1 off the deck and now produce card_2 as the current card
#REPEAT ABOVE CYCLE FROM BEGIN REPL TO END REPL

require_relative "./card"
require_relative "./guess"
require_relative "./deck"
require_relative "./round"
require "pry"

card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
card_3 = Card.new("On which street is Turing located?", "Blake")
card_4 = Card.new("How many months are in a year?", "12")
card_5 = Card.new("How many inches are in a foot?", "12")
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
round = Round.new(deck)

deck_start = deck.count
puts ""
puts "Welcome! You're playing with #{deck.count} cards.\n"
puts "-------------------------------------------------\n"
until deck.count == 0
puts "This is card number #{(deck.count) - (deck.count-1)} out of #{deck_start}"
card = round.current_card
puts card.question
guess = Guess.new(gets.chomp, card)
round.record_guess(guess)
puts guess.feedback
puts round.number_correct
puts round.percent_correct
end
# puts "****** GAME OVER!!! ******\n"
# puts "You had #{round.number_correct} out of #{deck_start} for a score of #{round.percent_correct}"
# #need to instantiate guess class right here
