require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/accept_file"


class AcceptFileTest < Minitest::Test

  def test_it_accepts_a_filename
    accept_file = AcceptFile.new
    filename = "trivia.txt"
    
    assert accept_file.accept_filename
  end

end
