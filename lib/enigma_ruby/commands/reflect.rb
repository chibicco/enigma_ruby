module EnigmaRuby
  module Commands
    class Reflect < Base
      def execute(context)
        context[:encoded_char] = Reflector.reflect(context[:encoded_char])
      end
    end
  end
end
