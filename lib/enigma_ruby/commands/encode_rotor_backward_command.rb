module EnigmaRuby
  class EncodeRotorBackwardCommand < Command
    def initialize(rotors)
      @rotors = rotors
    end

    def execute(context)
      @rotors.reverse_each do |rotor|
        context[:encoded_char] = rotor.encode_backward(context[:encoded_char])
      end
    end
  end
end
