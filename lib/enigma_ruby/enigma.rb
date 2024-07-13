module EnigmaRuby
  SKIP_CHARACTERS_REGEX  = /[']/.freeze
  NON_ENCRYPTED_CHARACTERS_REGEX  = /[ .,;0-9]/.freeze

  class Enigma
    def initialize(rotor_settings = [])
      initialize_rotors(rotor_settings)
      @commands = [
        Commands::SwapPlugboard.new,
        Commands::EncodeRotorForward.new(@rotors),
        Commands::Reflect.new,
        Commands::EncodeRotorBackward.new(@rotors),
        Commands::SwapPlugboard.new,
        Commands::AdvanceRotors.new(@rotors)
      ]
    end

    def encrypt(cleartext)
      encoded_text = ''
      cleartext.each_char do |char|
        next if SKIP_CHARACTERS_REGEX .match?(char)
        next encoded_text << char if NON_ENCRYPTED_CHARACTERS_REGEX .match?(char)

        context = { encoded_char: char }
        @commands.each { |command| command.execute(context) }
        encoded_text << context[:encoded_char]
      end
      encoded_text
    end

    private

    def initialize_rotors(rotor_settings)
      @rotors = rotor_settings.map { |config| Rotor.new(config[:wiring], config[:position]) }
    end
  end
end
