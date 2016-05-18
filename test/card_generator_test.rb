require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/card_generator"
require "pry"

class CardGeneratorTest < Minitest::Test

  def test_it_reads_a_file
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)

    assert_equal "What is 5 + 5?,10\nWhat is Rachel's favorite animal?,red panda\nWhat is Mike's middle name?,nobody knows\nWhat cardboard cutout lives at Turing?,Justin Bieber\n", cards.read_file
  end

  def test_it_separates_entire_text_into_individual_cards
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)

    assert_equal ["What is 5 + 5?,10", "What is Rachel's favorite animal?,red panda", "What is Mike's middle name?,nobody knows", "What cardboard cutout lives at Turing?,Justin Bieber"], cards.separate_file_into_cards
  end

  def test_it_separates_cards_into_question_and_answer
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)

    assert_equal [["What is 5 + 5?", "10"], ["What is Rachel's favorite animal?", "red panda"], ["What is Mike's middle name?", "nobody knows"], ["What cardboard cutout lives at Turing?", "Justin Bieber"]], cards.separate_cards_into_question_and_answer
  end

  def test_it_makes_a_single_card_out_of_a_question_and_answer
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)
    # card = Card.new("What is 5+5?", "10")

    deck = cards.make_a_deck
    assert_equal("What is 5 + 5?", card.question)
    assert_equal("10", card.answer)
  end

end
