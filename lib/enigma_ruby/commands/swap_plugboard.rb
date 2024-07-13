module EnigmaRuby
  module Commands
    class SwapPlugboard < Base
      def execute(context)
        context[:encoded_char] = Plugboard.swap(context[:encoded_char])
      end
    end
  end
end
