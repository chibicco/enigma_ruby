require "enigma_ruby/version"
require "enigma_ruby/rotor"
require "enigma_ruby/reflector"
require "enigma_ruby/plugboard"
require "enigma_ruby/enigma"
require "enigma_ruby/commands/base"
require "enigma_ruby/commands/advance_rotors"
require "enigma_ruby/commands/encode_rotor_backward"
require "enigma_ruby/commands/encode_rotor_forward"
require "enigma_ruby/commands/reflect"
require "enigma_ruby/commands/swap_plugboard"

module EnigmaRuby
  DEFAULT_ROTOR_SETTINGS = [
    { wiring: 'EKMFLGDQVZNTOWYHXUSPAIBRCJ', position: 12 },
    { wiring: 'AJDKSIRUXBLHWTMCQGZNPYFVOE', position: 2 },
    { wiring: 'BDFHJLCPRTXVZNYEIWGAKMUSQO', position: 10 },
  ].freeze

  def self.encrypt(cleartext, rotor_settings = DEFAULT_ROTOR_SETTINGS)
    Enigma.new(rotor_settings).encrypt(cleartext)
  end
end
