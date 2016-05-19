require_relative "./card_generator"


class AcceptFile
attr_reader :filename

  # def initialize(user_filename)
  #    @user_filename = user_filename
  # end

  def ask_user_for_filename
    puts "Please enter a filename:"
    @filename = gets.chomp
    puts filename
  end

  def accept_filename
    if File.file?(filename)
      CardGenerator.new(filename.to_s)
    end
  end
end
