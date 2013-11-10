lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "words_and_numbers/version"

Gem::Specification.new do |gem|
  gem.name          = "words_and_numbers"
  gem.version       = WordsAndNumbers::VERSION
  gem.authors       = ["Dave Stevens"]
  gem.email         = ["d4v3.uk@googlemail.com"]
  gem.description   = "Convert words to numbers and visa verse"
  gem.summary       = "Convert words to numbers and visa verse"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "simplecov"
end
