require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/deck"
require_relative "../lib/card"
require "pry"

class DeckTest < Minitest::Test

  def test_it_stores_a_single_card
    card = Card.new("How many months are in a year?", "12")
    deck = Deck.new([card])

    #check that it can hold a single card
    assert_equal [card], deck.cards
  end

  def test_it_counts_a_single_card
    card = Card.new("How many months are in a year?", "12")
    deck = Deck.new([card])

    #check that it can count a single card
    assert_equal 1, deck.count
  end

  def test_it_stores_many_cards
    #make some cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")

    #make a deck with cards in it
    deck = Deck.new([card_1, card_2, card_3])

    #check if the deck holds the cards
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_it_counts_many_cards_in_the_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")

    #make a deck with cards in it
    deck = Deck.new([card_1, card_2, card_3])

    #check if the cards in the deck can be counted
    assert_equal 3, deck.count
  end
end
