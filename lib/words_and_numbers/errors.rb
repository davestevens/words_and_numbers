module WordsAndNumbers
  class Error < StandardError; end

  class ConversionError < Error; end
  class UnsupportedType < Error; end
end
