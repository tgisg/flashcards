require_relative "./deck"
require_relative "./round"
require_relative "./card_generator"

filename = "./lib/cards.txt"
cards = CardGenerator.new(filename)
deck = Deck.new(cards.make_a_deck)
round = Round.new(deck)

round.start
