
module EnigmaRuby
  class Plugboard
    PAIRS = %w[AF BE CD].freeze

    def self.swap(char)
      check_duplicates

      PAIRS.each do |pair|
        return pair[1] if pair[0] == char
        return pair[0] if pair[1] == char
      end
      char
    end

    def self.check_duplicates
      characters = PAIRS.join.chars
      duplicates = characters.select { |char| characters.count(char) > 1 }.uniq
      raise "Duplicate characters found: #{duplicates.join(', ')}" if duplicates.any?
    end
  end
end
