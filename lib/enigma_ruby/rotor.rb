module EnigmaRuby
  class Rotor
    def initialize(wiring, position = 0)
      @wiring = wiring.chars
      @position = @notch = position
    end

    def encode_forward(char)
      index = (char.ord - 'A'.ord + @position) % 26
      @wiring[index]
    end

    def encode_backward(char)
      index = @wiring.index(char)
      ((index - @position) % 26 + 'A'.ord).chr
    end

    def advance
      @position = (@position + 1) % 26
    end

    def at_notch?
      @position == @notch
    end
  end
end
