module EnigmaRuby
  module Commands
    class Base
      def execute(context)
        raise NotImplementedError, 'Subclasses must implement execute(context)'
      end
    end
  end
end
