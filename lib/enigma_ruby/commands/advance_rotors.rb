module EnigmaRuby
  module Commands
    class AdvanceRotors < Base
      def initialize(rotors)
        @rotors = rotors
      end

      def execute(_)
        @rotors[0].advance
        @rotors.each_with_index do |rotor, i|
          next if i == 0
          break unless @rotors[i - 1].at_notch?

          rotor.advance
        end
      end
    end
  end
end
