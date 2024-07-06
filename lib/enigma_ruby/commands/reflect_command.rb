module EnigmaRuby
  class ReflectCommand < Command
    def execute(context)
      context[:encoded_char] = Reflector.reflect(context[:encoded_char])
    end
  end
end
