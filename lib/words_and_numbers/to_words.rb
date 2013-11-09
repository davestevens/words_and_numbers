require "words_and_numbers/words"

module WordsAndNumbers
  class ToWords
    # Convert a Fixnum to a string
    def self.convert(input)
      @input = input
      raise WordsAndNumbers::ConversionError,
        "Unsupported Type: #{@input.class}" unless correct_input?

      process
      build
    end

    # Build @processed array into final output
    def self.build
      labelled = []
      @processed.each_with_index do |section, index|
        section << " #{Words.l[index]}" unless index == 0 || section == Words.ltt[0]
        labelled << section unless section == Words.ltt[0]
      end

      string = labelled.reverse.join(" ")
      string.empty? ? Words.ltt[0] : string
    end

    # Split @input into thousands
    def self.process
      @processed = []
      decimal = @input

      while decimal >= 1
        @processed << to_string(decimal % 1000)
        decimal /= 1000
      end
    end

    # Return number described in words
    def self.to_string(thousand)
      string = ""
      number = split(thousand)

      if number[0] != 0
        string << Words.ltt[number[0]]
        string << " #{Words.l[0]}"
      end

      tmp = (number[1] * 10) + number[2]

      if Words.ltt[tmp]
        string << " " unless string.empty? || tmp == 0
        string << Words.ltt[tmp] unless tmp == 0
      else
        string << " " unless string.empty?
        string << Words.ttn[number[1] - 2]
        string << "-#{Words.ltt[number[2]]}" unless number[2] == 0
      end

      string.empty? ? Words.ltt[0] : string
    end

    # Split number into array
    def self.split(number, length = 3)
      ("%0#{length}d" % number).split("").map(&:to_i)
    end

    # Check if @input is a Fixnum
    def self.correct_input?
      @input.is_a?(Fixnum)
    end

  end
end
