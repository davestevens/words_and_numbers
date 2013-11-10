require "spec_helper"

describe WAN do
  subject { described_class.new.class }

  it "extends WordsAndNumbers::WAN" do
    expect(subject.ancestors).to include(WordsAndNumbers::WAN)
  end
end
