#Words and Numbers#

Convert numbers to and from words.

##Instalation
```
gem "words_and_numbers", git: "git://github.com/davestevens/words_and_numbers.git"
gem "words_and_numbers", git: "git://github.com/davestevens/words_and_numbers"
```

##Usage
```ruby
require "words_and_numbers"

wan = WAN.new(123)
wan.number
  #=> 123
wan.word
  #=> "one hundred twenty-three"

wan.set = 1_234
wan.number
  #=> 1_234
wan.word
  #=> "one thousand two hundred thirty-four"

wan.set = "six hundred seventy-eight thousand"
wan.number
  #=> 678_000
wan.word
  #=> "six hundred seventy-eight thousand"
```

##TODO
* Input/Ouput ordinal numbers
* Configuration
 * Add/Remove join word (eg. "and")
 * Add/Remove join hypen
