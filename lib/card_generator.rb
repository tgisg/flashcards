require_relative "./card"

class CardGenerator
attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read_file
    handle = File.open(filename, "r")
    incoming_text = handle.read
    handle.close
    incoming_text.to_s
  end

  def separate_file_into_cards
    read_file.split("\n")
  end

  def separate_cards_into_question_and_answer
    cards = separate_file_into_cards
      cards.map do |card|
        card.split(",")
      end
  end

  def make_a_deck
    cards_group = separate_cards_into_question_and_answer
      deck = cards_group.map do |card|
        Card.new(card[0], card[1])
      end
    deck
  end

end
