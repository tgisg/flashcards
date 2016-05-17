require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/guess"
require_relative "../lib/card"
require "pry"

class GuessTest < Minitest::Test

  def test_it_takes_in_the_card
    #make a card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    #make a guess
    guess = Guess.new("Juneau", card)

    #check that a card can be passed into the guess object
    assert_equal card, guess.card
  end

  def test_it_accepts_a_response_from_the_user
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    #check that a user response can be passed into the guess object
    assert_equal "Juneau", guess.response
  end

  def test_it_checks_whether_response_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    #check that the response is the same as the answer on the card
    assert guess.correct?
  end

  def test_it_gives_affirmative_feedback_if_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    #check that the user gets feedback
    assert_equal "Correct!", guess.feedback
  end

  def test_it_checks_whether_response_is_incorrect
    card = Card.new("What is the planet closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    #check that the response is not the same as the answer on the card
    refute guess.correct?
  end

  def test_it_gives_negative_feedback_if_incorrect
    card = Card.new("What is the planet closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Incorrect!", guess.feedback
  end
end
