module EnigmaRuby
  class Rotor
    def initialize(wiring, position = 0)
      @wiring = wiring.chars
      @position = @notch = position
    end

    def encode_forward(char)
      index = (char.ord - 'A'.ord + @position) % wiring_size
      @wiring[index]
    end

    def encode_backward(char)
      index = @wiring.index(char)
      ((index - @position) % wiring_size + 'A'.ord).chr
    end

    def advance
      @position = (@position + 1) % wiring_size
    end

    def at_notch?
      @position == @notch
    end

    private

    def wiring_size
      @wiring.size
    end
  end
end
