
module EnigmaRuby
  class Plugboard
    WIRING = {
      'A' => 'F', 'F' => 'A',
      'B' => 'E', 'E' => 'B',
      'C' => 'D', 'D' => 'C'
    }.freeze

    def self.swap(char)
      WIRING[char] || char
    end
  end
end
