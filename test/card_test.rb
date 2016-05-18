require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/card"
require_relative "../lib/deck"
require "pry"

class CardTest < Minitest::Test

  def test_card_has_question_and_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_equal("What is the capital of Alaska?", card.question)
    assert_equal("Juneau", card.answer)
  end
  
end
