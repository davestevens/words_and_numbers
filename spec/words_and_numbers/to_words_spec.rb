require "spec_helper"

describe WordsAndNumbers::ToWords do
  let(:input) { nil }
  subject { described_class.convert(input) }

  context "when passed a Fixnum" do
    let(:input) { 123 }
    let(:output) { "one hundred twenty-three" }

    it "converts the number to a string" do
      expect(subject).to be_a(String)
      expect(subject).to eq(output)
    end
  end

  context "when passed non Fixnum" do
    it "raises Conversion error" do
      expect { subject }.to raise_error(WordsAndNumbers::ConversionError,
        "Unsupported Type: NilClass")
    end
  end

  describe ".build" do
    subject { described_class }

    [
     { input: ["one hundred twenty-three"],
       output: "one hundred twenty-three" },
     { input: ["one hundred twenty-three", "four hundred fifty-six"],
       output: "four hundred fifty-six thousand one hundred twenty-three" },
     { input: ["one", "twenty-two"],
       output: "twenty-two thousand one" },
     { input: ["one", "zero", "two"],
       output: "two million one" }
    ].each do |build|
      it "returns #{build[:output]} from #{build[:input]}" do
        subject.instance_variable_set(:@processed, build[:input])
        output = subject.build

        expect(output).to eq(build[:output])
      end
    end
  end

  describe ".process" do
    subject { described_class }

    it "splits input into thousand sections" do
      subject.instance_variable_set(:@input, 1234567)
      subject.process

      processed = subject.instance_variable_get(:@processed)

      expect(processed).to be_an(Array)
      expect(processed[0]).to eq("five hundred sixty-seven")
      expect(processed[1]).to eq("two hundred thirty-four")
      expect(processed[2]).to eq("one")
    end
  end

  describe ".split" do
    subject { described_class }

    [
     { input: 0, output: [0, 0, 0] },
     { input: 123, output: [1, 2, 3] },
     { input: 9, output: [0, 0, 9] },
     { input: 10, output: [0, 1, 0] },
    ].each do |split|
      it "returns #{split[:output]} from #{split[:input]}" do
        output = subject.split(split[:input])
        expect(output).to eq(split[:output])
      end
    end
  end

  describe ".to_string" do
    subject { described_class }

    [
     { input: 567, output: "five hundred sixty-seven" },
     { input: 0, output: "zero" },
     { input: 123, output: "one hundred twenty-three" },
     { input: 9, output: "nine" },
     { input: 10, output: "ten" },
     { input: 49, output: "fourty-nine" },
     { input: 60, output: "sixty" },
     { input: 100, output: "one hundred" },
     { input: 101, output: "one hundred one" },
     { input: 116, output: "one hundred sixteen" },
     { input: 540, output: "five hundred fourty" }
    ].each do |to_string|
      it "returns #{to_string[:output]} from #{to_string[:input]}" do
        output = subject.to_string(to_string[:input])
        expect(output).to eq(to_string[:output])
      end
    end
  end
end
