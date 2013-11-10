require "spec_helper"

describe WordsAndNumbers::WAN do

  describe "Initializing WAN" do
    let(:fixnum) { 123 }
    let(:string) { "one hundred twenty-three" }
    let(:unsupported) { 1.23 }

    context "with a Fixnum" do
      subject { described_class.new(fixnum) }

      it "sets @number" do
        number = subject.instance_variable_get(:@number)
        expect(number).to eq(fixnum)
      end

      it "sets @word" do
        word = subject.instance_variable_get(:@word)
        expect(word).to eq(string)
      end
    end

    context "with a String" do
      subject { described_class.new(string) }

      it "sets @word" do
        word = subject.instance_variable_get(:@word)
        expect(word).to eq(string)
      end

      it "sets @number" do
        number = subject.instance_variable_get(:@number)
        expect(number).to eq(fixnum)
      end
    end

    context "with an unsupported type" do
      subject { described_class.new(unsupported) }

      it "raises error" do
        expect { subject }.to raise_error(WordsAndNumbers::UnsupportedType,
          "Unsupported type: Float")
      end
    end

    context "without passing variable" do
      subject { described_class.new }

      it "does not set @word" do
        word = subject.instance_variable_get(:@word)
        expect(word).to be_nil
      end

      it "does not set @number" do
        number = subject.instance_variable_get(:@number)
        expect(number).to be_nil
      end
    end
  end

  describe "Setting WAN" do
    let(:fixnum) { 123 }
    let(:string) { "one hundred twenty-three" }
    let(:unsupported) { 1.23 }

    context "with a Fixnum" do
      subject do
        klass = described_class.new
        klass.set = fixnum

        klass
      end

      it "sets @number" do
        number = subject.instance_variable_get(:@number)
        expect(number).to eq(fixnum)
      end

      it "sets @word" do
        word = subject.instance_variable_get(:@word)
        expect(word).to eq(string)
      end
    end

    context "with a String" do
      subject do
        klass = described_class.new
        klass.set = string

        klass
      end

      it "sets @word" do
        word = subject.instance_variable_get(:@word)
        expect(word).to eq(string)
      end

      it "sets @number" do
        number = subject.instance_variable_get(:@number)
        expect(number).to eq(fixnum)
      end
    end
  end

  describe "Getting WAN" do
    let(:fixnum) { 123 }
    let(:string) { "one hundred twenty-three" }

    context "with setting a Fixnum" do
      subject { described_class.new(fixnum) }

      it "returns @word" do
        expect(subject.word).to eq(string)
      end

      it "returns @number" do
        expect(subject.number).to eq(fixnum)
      end
    end

    context "with setting a String" do
      subject { described_class.new(string) }

      it "returns @number" do
        expect(subject.number).to eq(fixnum)
      end

      it "returns @word" do
        expect(subject.word).to eq(string)
      end
    end

  end
end
