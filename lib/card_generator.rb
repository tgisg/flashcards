
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

def make_a_card
  cards_group = separate_cards_into_question_and_answer
  single_card = cards_group.shift
  Card.new(single_card[0], single_card[1])
end

end









#open the text tile
#read the text file
#separate tf line by line
#separate each line along the comma --> .split(",") creates an array of the question[0] and answer[1]
#pass the question and answer into a new card object.

#card_question = CardGenerator.new.question
#card_answer = CardGenerator.new.answer

#card = Card.new(card_question, card_answer)
#then your runner calls upon these new cards


# class CardGenerator
#   attr_accessor :incoming_text
#
#   def read_text_file
#     handle = File.open(ARGV[0], "r")
#     incoming_text = handle.read
#     handle.close
#     @incoming_text
#   end
  # require "pry"
  # handle = File.open(ARGV[0], "r")
  # q_and_a = handle.each_line do |line|
  #   line.split(",")
  # end
  # handle.close
  # puts q_and_a
  # # card = Card.new(q_and_a[0], q_and_a[1])


#   end
# end
#
# end
