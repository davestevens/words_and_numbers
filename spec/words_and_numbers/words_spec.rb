require "spec_helper"

describe WordsAndNumbers::Words do
  describe "CARDINAL_NUMBERS" do
    describe "LESS_THAN_TWENTY" do
      subject { described_class.ltt }

      it "defines english words for numbers" do
        expect(subject.length).to eq(20)
        expect(subject.first).to eq("zero")
      end
    end

    describe "TWENTY_TO_NINETY" do
      subject { described_class.ttn }

      it "defines english words for numbers" do
        expect(subject.length).to eq(8)
        expect(subject.first).to eq("twenty")
      end
    end

    describe "LARGE" do
      subject { described_class.l }

      it "defines english words for numbers" do
        expect(subject.length).to eq(7)
        expect(subject.first).to eq("hundred")
      end
    end
  end
end
