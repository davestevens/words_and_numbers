module WordsAndNumbers
  module Conversion
    def convert(input)
      @input = input
      raise WordsAndNumbers::ConversionError,
        "Unsupported Type: #{@input.class}" unless correct_input?

      process
      build
    end

    # Check if @input is valid type
    def correct_input?
      conversion_types.include?(@input.class)
    end
  end
end
