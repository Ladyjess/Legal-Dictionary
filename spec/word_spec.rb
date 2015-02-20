require 'rspec'
require 'word'
require 'definition'


describe Word do
  before do
    Word.clear
  end

  describe 'vocabulary' do
    it 'adds vocabulary to list' do
      test_word = Word.new({:vocabulary => "Last-straw Doctrine", :word_definition => "Job termination is justified by a series of incidents of poor performance", :id => 4})
      test_word.save
      expect(test_word.vocabulary).to eq "Last-straw Doctrine"
    end
  end

  describe "#save" do
    it "saves a new vocabulary" do
      test_word = Word.new({:vocabulary => "Defamation", :word_definition => "The communication of a statement that makes a false claim", :id => 3})
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
      test_word = Word.new({:vocabulary => "Intellectual Property", :word_definition => "The general term for intangible property rights which are a result of intellectual effort", :id => 2})
      test_word.save
      expect(Word.clear).to eq []
    end
  end

  describe '#id' do
    it 'gives the words an id' do
      test_word = Word.new({:vocabulary => "Attractive Nuisance", :word_definition => "States that a landowner may be held liable for injuries to children trespassing on the land", :id => 1})
      test_word.save
      expect(test_word.id).to eq 1
    end
  end

  describe '.find' do
    it 'returns the vocabulary' do
      test_word = Word.new({:vocabulary => "Attractive Nuisance", :word_definiton => "States that a landowner may be held liable for injuries to children trespassing on the land", :id => 1})
      test_word.save
      test_word2 = Word.new({:vocabulary => "Defamation", :word_definition => "The communication of a statement that makes a false claim", :id => 3})
      test_word2.save
      expect(Word.find(test_word.id)).to eq test_word
    end
  end

  describe '#set_id' do
    it 'sets the id for a word' do
      test_word = Word.new({:vocabulary => "Defamation", :word_definition => "The communication of a statement that makes a false claim", :id => 3})
      test_word.save
      expect(test_word.set_id).to eq 2
    end
  end

  describe '#add_definition' do
    it 'allows users to add definitions' do
      test_word = Word.new({:vocabulary => "Defamation", :id => 3})
      test_definition = Definition.new({:word_definition => "The communication of a statement that makes a false claim", :id => 3})
      test_word.add_definition(test_definition)
      expect(test_word.definitions).to eq [test_definition]
    end
  end
end
