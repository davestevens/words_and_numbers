scope group: :dev

group :dev do
  guard "rspec" do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{lib/words_ands_numbers.rb}) { "spec" }
    watch(%r{lib/words_and_numbers/.+.rb}) { "spec" }
  end
end
