module EnigmaRuby
  module Commands
    class EncodeRotorForward < Base
      def initialize(rotors)
        @rotors = rotors
      end

      def execute(context)
        @rotors.each do |rotor|
          context[:encoded_char] = rotor.encode_forward(context[:encoded_char])
        end
      end
    end
  end
end
