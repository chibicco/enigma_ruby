module EnigmaRuby
  class Reflector
    WIRING = 'YRUHQSLDPXNGOKMIEBFZCWVJAT'.freeze

    def self.reflect(char)
      index = char.ord - 'A'.ord
      WIRING[index]
    end
  end
end
