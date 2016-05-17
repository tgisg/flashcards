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

class FlashCardRunner

  def start_game
    puts "Welcome! You're playing with #{deck.count} cards.\n------------------------------------------"
    puts "This is card number #{(deck.length)-(deck.)}"


  end

end
