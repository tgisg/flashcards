require_relative "./deck"
require_relative "./round"
require_relative "./card_generator"
require "pry"

# card_1 = Card.new("What is the capital of Alaska?", "Juneau")
# card_2 = Card.new("What is Mike's last name?", "Dao")
# card_3 = Card.new("On which street is Turing located?", "Blake")
# card_4 = Card.new("How many days are in a week?", "7")
# card_5 = Card.new("How many inches are in a foot?", "12")
filename = "./lib/cards.txt"
cards = CardGenerator.new(filename)
deck = cards.make_a_deck

# deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
deck = Deck.new(deck)

round = Round.new(deck)

round.start
