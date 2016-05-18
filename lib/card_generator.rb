require_relative "./card"

#open the text tile
#read the text file
#separate tf line by line
#separate each line along the comma --> .split(",") creates an array of the question[0] and answer[1]
#pass the question and answer into a new card object.

#card_question = CardGenerator.new.question
#card_answer = CardGenerator.new.answer

#card = Card.new(card_question, card_answer)
#then your runner takes these cards in


class CardGenerator
  attr_accessor :incoming_text

  def read_text_file
    handle = File.open(ARGV[0], "r")
    incoming_text = handle.read
    handle.close
    @incoming_text
  end

  handle = File.open(ARGV[0], "r")
  q_and_a = handle.each_line do |line|
    line.split(",")
  end
  handle.close


  end
end

end
