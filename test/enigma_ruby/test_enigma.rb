require 'test_helper'

module EnigmaRuby
  class TestEnigma < Minitest::Test
    class SpyEnigma < Enigma
      attr_reader :rotors

      private

      def initialize_rotors(rotor_settings)
        @rotors = rotor_settings.map { |config| SpyRotor.new(config[:wiring], config[:position]) }
      end
    end

    class SpyRotor < Rotor
      attr_reader :advance_call_count

      def initialize(*args)
        super
        @advance_call_count = 0
      end

      def advance
        @advance_call_count += 1
        super
      end
    end

    def setup
      @rotor_settings = EnigmaRuby::DEFAULT_ROTOR_SETTINGS
    end

    def test_encrypt
      cleartext = 'HELLO'
      encrypted_text = 'TQEPK'

      enigma_text = EnigmaRuby::Enigma.new(@rotor_settings).encrypt(cleartext)
      assert_equal encrypted_text, enigma_text

      enigma_text = EnigmaRuby::Enigma.new(@rotor_settings).encrypt(encrypted_text)
      assert_equal cleartext, enigma_text
    end

    def test_encrypt_alphabet
      cleartext = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      encrypted_text = 'EFZYXWALHAMJJMCITTQSYUSZWW'

      enigma_text = EnigmaRuby::Enigma.new(@rotor_settings).encrypt(cleartext)
      assert_equal encrypted_text, enigma_text

      enigma_text = EnigmaRuby::Enigma.new(@rotor_settings).encrypt(encrypted_text)
      assert_equal cleartext, enigma_text
    end

    def test_encrypt_matthew_7
      cleartext = 'ASK AND IT WILL BE GIVEN TO YOU; SEEK AND YOU WILL FIND; KNOCK AND THE DOOR WILL BE OPENED TO YOU. 8 FOR EVERYONE WHO ASKS RECEIVES; THE ONE WHO SEEKS FINDS; AND TO THE ONE WHO KNOCKS, THE DOOR WILL BE OPENED.'
      encrypted_text = 'EGJ HYO MS PTOJ CA IPWXJ SQ MMA; RFDD OBU GJV GRFO TXOL; EXGGU WXZ DZU QJFP PSTN CG ZILGWK IN KNO. 8 ITL TSCMDRQL GQR ODFO NAYBAFYI; DAN BQX FDI GJWBV VYKUH; DSS AW WCP FZP EYD XZSMWA, MTC FJHQ YRZX FG TRKPSO.'

      enigma_text = EnigmaRuby::Enigma.new(@rotor_settings).encrypt(cleartext)
      assert_equal encrypted_text, enigma_text

      enigma_text = EnigmaRuby::Enigma.new(@rotor_settings).encrypt(encrypted_text)
      assert_equal cleartext, enigma_text
    end

    def test_encrypt_and_advance_count
      cleartext = 'HELLO'
      encrypted_text = 'TQEPK'

      enigma = SpyEnigma.new(@rotor_settings)
      enigma_text = enigma.encrypt(cleartext)
      assert_equal encrypted_text, enigma_text

      assert_equal 5, enigma.rotors[0].advance_call_count, "First rotor should have advanced 5 times"
      assert_equal 0, enigma.rotors[1].advance_call_count, "Second rotor should have advanced 0 times"
      assert_equal 0, enigma.rotors[2].advance_call_count, "Third rotor should have advanced 0 times"
    end

    def test_encrypt_alphabet_and_advance_count
      cleartext = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      encrypted_text = 'EFZYXWALHAMJJMCITTQSYUSZWW'

      enigma = SpyEnigma.new(@rotor_settings)
      enigma_text = enigma.encrypt(cleartext)
      assert_equal encrypted_text, enigma_text

      assert_equal 26, enigma.rotors[0].advance_call_count, "First rotor should have advanced 16 times"
      assert_equal 1, enigma.rotors[1].advance_call_count, "Second rotor should have advanced 1 times"
      assert_equal 0, enigma.rotors[2].advance_call_count, "Third rotor should have advanced 0 times"
    end

    def test_encrypt_matthew_7_and_advance_count
      cleartext = 'ASK AND IT WILL BE GIVEN TO YOU; SEEK AND YOU WILL FIND; KNOCK AND THE DOOR WILL BE OPENED TO YOU. 8 FOR EVERYONE WHO ASKS RECEIVES; THE ONE WHO SEEKS FINDS; AND TO THE ONE WHO KNOCKS, THE DOOR WILL BE OPENED.'
      encrypted_text = 'EGJ HYO MS PTOJ CA IPWXJ SQ MMA; RFDD OBU GJV GRFO TXOL; EXGGU WXZ DZU QJFP PSTN CG ZILGWK IN KNO. 8 ITL TSCMDRQL GQR ODFO NAYBAFYI; DAN BQX FDI GJWBV VYKUH; DSS AW WCP FZP EYD XZSMWA, MTC FJHQ YRZX FG TRKPSO.'

      enigma = SpyEnigma.new(@rotor_settings)
      enigma_text = enigma.encrypt(cleartext)
      assert_equal encrypted_text, enigma_text

      assert_equal 158, enigma.rotors[0].advance_call_count, "First rotor should have advanced 16 times"
      assert_equal 6, enigma.rotors[1].advance_call_count, "Second rotor should have advanced 1 times"
      assert_equal 0, enigma.rotors[2].advance_call_count, "Third rotor should have advanced 0 times"
    end
  end
end
