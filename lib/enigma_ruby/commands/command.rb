module EnigmaRuby
  class Command
    def execute(context)
      raise NotImplementedError, 'Subclasses must implement execute(context)'
    end
  end
end
