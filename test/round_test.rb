require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/round"
require_relative "../lib/deck"
require_relative "../lib/card"
require_relative "../lib/guess"
require "pry"

class RoundTest < Minitest::Test

  def test_it_stores_a_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_it_returns_no_guesses_if_none_have_been_made
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_points_to_the_current_card_after_running_the_previous_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("How many inches are in a foot?", "12")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
    assert_equal card_2, round.current_card
    assert_equal card_3, round.current_card
  end


  def test_it_records_a_single_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", card_1)

    assert_equal guess, round.record_guess(guess)
  end

  def test_it_counts_a_single_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", card_1)
    # binding.pry

    round.record_guess(guess)

    assert_equal 1, round.guesses.count
  end

  def test_it_records_multiple_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1)
    guess_2 = Guess.new("93,000,000", card_2)

    assert_equal guess_1, round.record_guess(guess_1)
    assert_equal guess_2, round.record_guess(guess_2)
  end

  def test_it_counts_multiple_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1)
    guess_2 = Guess.new("93,000,000", card_2)

    round.record_guess(guess_1)
    round.record_guess(guess_2)

    assert_equal 2, round.guesses.count
  end

  def test_it_returns_positive_feedback_on_most_recent_guess_if_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1)
    guess_2 = Guess.new("93,000,000", card_2)

    round.record_guess(guess_1)
    round.record_guess(guess_2)

    assert_equal "Correct!", round.guesses.last.feedback
  end

  def test_it_returns_negative_feedback_on_most_recent_guess_if_incorrect
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1)
    guess_2 = Guess.new("500", card_2)

    round.record_guess(guess_1)
    round.record_guess(guess_2)

    assert_equal "Incorrect!", round.guesses.last.feedback
  end

  def test_it_counts_the_number_of_correct_guesses_with_one_correct_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("On which street is Turing located?", "Blake")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1) #--> correct


    round.record_guess(guess_1)

    assert_equal 1, round.number_correct
  end

  def test_it_counts_the_number_of_correct_guesses_with_one_incorrect_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("On which street is Turing located?", "Blake")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess_1 = Guess.new("Miami", card_1) #--> incorrect

    round.record_guess(guess_1)

    assert_equal 0, round.number_correct
  end

  def test_it_counts_the_number_of_correct_guesses_with_multiple_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("On which street is Turing located?", "Blake")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1) #--> correct
    guess_2 = Guess.new("93,000,000", card_2) #--> correct
    guess_3 = Guess.new("Blake", card_3) # --> correct

    round.record_guess(guess_1)
    round.record_guess(guess_2)
    round.record_guess(guess_3)

    assert_equal 3, round.number_correct
  end

  def test_it_counts_the_number_of_correct_guesses_with_some_correct_and_some_incorrect_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("On which street is Turing located?", "Blake")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1) #--> correct
    guess_2 = Guess.new("500", card_2) #--> incorrect
    guess_3 = Guess.new("Blake", card_3) # --> correct

    round.record_guess(guess_1)
    round.record_guess(guess_2)
    round.record_guess(guess_3)

    assert_equal 2, round.number_correct
  end

  def test_it_returns_the_percent_of_correct_guesses_with_multiple_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("On which street is Turing located?", "Blake")
    card_4 = Card.new("How many months are in a year?", "12")
    card_5 = Card.new("How many inches are in a foot?", "12")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1) #--> correct
    guess_2 = Guess.new("500", card_2) #--> incorrect
    guess_3 = Guess.new("Blake", card_3) # --> correct
    guess_4 = Guess.new("10", card_4) # --> incorrect
    guess_5 = Guess.new("10", card_5) #--> incorrect

    round.record_guess(guess_1)
    round.record_guess(guess_2)
    round.record_guess(guess_3)
    round.record_guess(guess_4)
    round.record_guess(guess_5)

    assert_equal 40, round.percent_correct
  end
  
end
