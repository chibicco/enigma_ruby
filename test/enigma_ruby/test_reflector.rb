require 'test_helper'

module EnigmaRuby
  class TestReflector < Minitest::Test
    def test_reflect
      assert_equal 'Y', EnigmaRuby::Reflector.reflect('A')
      assert_equal 'R', EnigmaRuby::Reflector.reflect('B')
      assert_equal 'U', EnigmaRuby::Reflector.reflect('C')
    end

    def test_reflect_full_alphabet
      alphabet = ('A'..'Z').to_a
      reflected = alphabet.map { |char| EnigmaRuby::Reflector.reflect(char) }
      expected = EnigmaRuby::Reflector::WIRING.chars
      assert_equal expected, reflected
    end
  end
end
