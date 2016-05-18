require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/round"
require_relative "../lib/deck"
require_relative "../lib/card"
require_relative "../lib/guess"
require_relative "../lib/card_generator"
require "pry"

class CardGeneratorTest < Minitest::Test

  def test_it_passes_in_a_file_name
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    assert_equal "cards.txt", cards
  end

  def test_it_turns_one_line_of_text_into_a_card

  end


end
