#DON'T FORGET TO REQUIRE CARD, GUESS, AND DECK

class Round
attr_reader :deck
attr_accessor :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    #I need to figure out how to bring the first card in the array to the fore and use it, and discard it.
    deck.cards.shift
  end

  def record_guess(guess)
    @guesses << guess 
    # @guesses.shift
  end




end
