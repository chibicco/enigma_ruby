require 'test_helper'

module EnigmaRuby
  class TestPlugboard < Minitest::Test
    def test_swap
      assert_equal 'F', EnigmaRuby::Plugboard.swap('A')
      assert_equal 'A', EnigmaRuby::Plugboard.swap('F')
      assert_equal 'E', EnigmaRuby::Plugboard.swap('B')
      assert_equal 'B', EnigmaRuby::Plugboard.swap('E')
      assert_equal 'D', EnigmaRuby::Plugboard.swap('C')
      assert_equal 'C', EnigmaRuby::Plugboard.swap('D')
    end

    def test_no_swap
      assert_equal 'G', EnigmaRuby::Plugboard.swap('G')
      assert_equal 'H', EnigmaRuby::Plugboard.swap('H')
    end
  end
end
