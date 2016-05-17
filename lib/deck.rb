#DONT FORGET TO REQUIRE CARD.RB
class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end



end
