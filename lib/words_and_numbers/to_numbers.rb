require "words_and_numbers/words"
require "words_and_numbers/conversion"

module WordsAndNumbers
  class ToNumbers
    extend WordsAndNumbers::Conversion
    # Convert a String to a Fixnum

    # Split @input into sections
    def self.process
      @processed = @input.split(%r{\W})
    end

    # Build @processed array into final output
    def self.build
      number = 0
      total = 0

      @processed.each do |word|
        if ltt[word]
          number += ltt[word]
        elsif ttn[word]
          number += (ttn[word] + 2) * 10
        elsif word == Words.l[0]
          number *= 100
        elsif l[word]
          total += number * (10 ** (l[word] * 3))
          number = 0
        end
      end

      total + number
    end

    # Enable lookup of numbers by word
    def self.ltt
      Hash[Words.ltt.map.with_index.to_a]
    end
    def self.ttn
      Hash[Words.ttn.map.with_index.to_a]
    end
    def self.l
      Hash[Words.l.map.with_index.to_a]
    end

    def self.conversion_types
      [String]
    end
  end
end
