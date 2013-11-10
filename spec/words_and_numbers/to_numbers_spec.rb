require "spec_helper"

describe WordsAndNumbers::ToNumbers do
  let(:input) { nil }
  subject { described_class.convert(input) }

  context "when passed a String" do
    let(:input) { "one hundred twenty-three" }
    let(:output) { 123 }

    it "converts the string to a number" do
      expect(subject).to be_a(Fixnum)
      expect(subject).to eq(output)
    end
  end

  context "when passed non String" do
    it "raises Conversion error" do
      expect { subject }.to raise_error(WordsAndNumbers::ConversionError,
        "Unsupported Type: NilClass")
    end
  end

  describe ".process" do
    subject { described_class }

    it "splits input on word boundaries" do
      subject.instance_variable_set(:@input,
        "one million two hundred thirty-four five hundred sixty-seven")
      subject.process

      processed = subject.instance_variable_get(:@processed)

      expect(processed).to be_an(Array)
      expect(processed).to eq(["one", "million", "two", "hundred", "thirty",
        "four", "five", "hundred", "sixty", "seven"])
    end
  end

  describe ".build" do
    subject { described_class }

    [
     { input: ["one", "hundred", "twenty", "three"],
       output: 123 },
     { input: ["four", "hundred", "fifty", "six", "thousand", "one",
         "hundred", "twenty", "three"],
       output: 456_123 },
     { input: ["twenty", "two", "thousand", "one"],
       output: 22_001 },
     { input: ["two", "million", "one"],
       output: 2_000_001 },
     { input: ["one"],
       output: 1 },
     { input: ["four", "thousand", "nine"],
       output: 4_009 }
    ].each do |build|
      it "returns #{build[:output]} from #{build[:input]}" do
        subject.instance_variable_set(:@processed, build[:input])
        output = subject.build

        expect(output).to eq(build[:output])
      end
    end
  end

  describe ".ltt" do
    subject { described_class.ltt }

    it "looks up numbers less than twenty by word" do
      expect(subject).to be_a(Hash)
      expect(subject["zero"]).to eq(0)
      expect(subject["nineteen"]).to eq(19)
    end
  end

  describe ".ttn" do
    subject { described_class.ttn }

    it "looks up numbers between twenty and ninety by word" do
      expect(subject).to be_a(Hash)
      expect(subject["twenty"]).to eq(0)
      expect(subject["ninety"]).to eq(7)
    end
  end

  describe ".l" do
    subject { described_class.l }

    it "looks up large numbers by word" do
      expect(subject).to be_a(Hash)
      expect(subject["hundred"]).to eq(0)
      expect(subject["quintillion"]).to eq(6)
    end
  end
end
