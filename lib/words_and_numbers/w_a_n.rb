module WordsAndNumbers
  class WAN
    attr_reader :word, :number

    def initialize(input = nil)
      set(input) if input
    end

    def set=(input)
      set(input)
    end

    def set(input)
      if ToWords.conversion_types.include?(input.class)
        from_numbers(input)
      elsif ToNumbers.conversion_types.include?(input.class)
        from_words(input)
      else
        raise UnsupportedType, "Unsupported type: #{input.class}"
      end
    end

    def from_words(input)
      @word = input
      @number = WordsAndNumbers::ToNumbers.convert(input)
    end

    def from_numbers(input)
      @number = input
      @word = WordsAndNumbers::ToWords.convert(input)
    end
  end
end
