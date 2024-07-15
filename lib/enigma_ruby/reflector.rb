module EnigmaRuby
  class Reflector
    WIRING = {
      'ORIGIN' => 'YRUHQSLDPXNGOKMIEBFZCWVJAT',
      'UKW-A' => 'EJMZALYXVBWFCRQUONTSPIKHGD',
      'UKW-B' => 'YRUHQSLDPXNGOKMIEBFZCWVJAT',
      'UKW-C' => 'FVPJIAOYEDRZXWGCTKUQSBNMHL'
    }.freeze

    def self.reflect(char, wiring_key = 'ORIGIN')
      index = char.ord - 'A'.ord
      WIRING[wiring_key][index]
    end
  end
end
