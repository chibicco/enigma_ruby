module EnigmaRuby
  class SwapPlugboardCommand < Command
    def execute(context)
      context[:encoded_char] = Plugboard.swap(context[:encoded_char])
    end
  end
end
