require 'rspec'
require 'word'
require 'definition'


describe Word do
  before do
    Word.clear
  end

  describe 'vocabulary' do
    it 'adds vocabulary to list' do
      test_word = Word.new("Last-straw Doctrine")
      test_word.save
      expect(test_word.vocabulary).to eq "Last-straw Doctrine"
    end
  end

  describe "#save" do
    it "saves a new vocabulary" do
      test_word = Word.new("Defamation")
      test_word.save
      expect(Word.all).to eq [test_word]
    end
  end

  describe ".all" do
    it "empty at first" do
      expect(Word.all).to eq []
    end
  end


  describe '.clear' do
    it 'empties the array' do
      test_word = Word.new("Intellectual Property")
      test_word.save
      expect(Word.clear).to eq []
    end
  end

  describe '#id' do
    it 'gives the words an id' do
      test_word = Word.new("Attractive Nuisance")
      test_word.save
      expect(test_word.id).to eq 1
    end
  end

  describe '.find' do
    it 'returns the vocabulary' do
      test_word = Word.new("Attractive Nuisance")
      test_word.save
      test_word2 = Word.new("Defamation")
      test_word2.save
      expect(Word.find(test_word.id)).to eq test_word
    end
  end

  describe '#set_id' do
    it 'sets the id for a word' do
      test_word = Word.new("Defamation")
      test_word.save
      expect(test_word.set_id).to eq 2
    end
  end

  describe '#add_definition' do
    it 'allows users to add definitions' do
      test_word = Word.new("Defamation")
      test_definition = Definition.new("The communication of a statement that makes a false claim")
      test_word.add_definition(test_definition)
      expect(test_word.definitions).to eq [test_definition]
    end
  end

  describe "definitions" do
    it "returns the definitions for a word" do
      test_word = Word.new("Defamation")
      test_definition = Definition.new("The communication of a statement that makes a false claim")
      test_definition2 = Definition.new("Yearly obligations to a financial institution.")
      test_word.add_definition(test_definition)
      test_word.add_definition(test_definition2)
      expect(test_word.definitions).to eq [test_definition, test_definition2]
    end
  end
end
