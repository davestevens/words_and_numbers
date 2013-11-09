module WordsAndNumbers
  class Words
    # Cardinal Number Constants
    LESS_THAN_TWENTY = [ "zero", "one", "two", "three", "four", "five", "six",
                         "seven", "eight", "nine", "ten", "eleven", "twelve",
                         "thirteen", "fourteen", "fifteen", "sixteen",
                         "seventeen", "eighteen", "nineteen" ]
    TWENTY_TO_NINETY = [ "twenty", "thirty", "fourty", "fifty", "sixty",
                         "seventy", "eighty", "ninety" ]
    LARGE = [ "hundred", "thousand", "million", "billion", "trillion",
              "quadrillion", "quintillion"]

    # Short names to access constants
    def self.ltt
      LESS_THAN_TWENTY
    end
    def self.ttn
      TWENTY_TO_NINETY
    end
    def self.l
      LARGE
    end
  end
end
