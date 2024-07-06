require 'test_helper'

module EnigmaRuby
  class TestRotor < Minitest::Test
    def setup
      @wiring = 'EKMFLGDQVZNTOWYHXUSPAIBRCJ'  # Enigma I Rotor I の配線
    end

    def test_encode_forward
      @rotor = EnigmaRuby::Rotor.new(@wiring, 0)
      assert_equal 'E', @rotor.encode_forward('A')
      assert_equal 'K', @rotor.encode_forward('B')
      assert_equal 'M', @rotor.encode_forward('C')
    end

    def test_encode_backward
      @rotor = EnigmaRuby::Rotor.new(@wiring, 0)
      assert_equal 'A', @rotor.encode_backward('E')
      assert_equal 'B', @rotor.encode_backward('K')
      assert_equal 'C', @rotor.encode_backward('M')
    end

    def test_position_affects_encoding_forward
      @rotor = EnigmaRuby::Rotor.new(@wiring, 1)
      assert_equal 'K', @rotor.encode_forward('A')
      assert_equal 'M', @rotor.encode_forward('B')
    end

    def test_position_affects_encoding_backward
      @rotor = EnigmaRuby::Rotor.new(@wiring, 1)
      assert_equal 'A', @rotor.encode_backward('K')
      assert_equal 'B', @rotor.encode_backward('M')
    end
  end
end
