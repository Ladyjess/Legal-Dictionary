require "rspec"
require "word"
require "definition"


describe Definition do
  before do
    Definition.clear
  end

  describe "#save" do
    it "saves a new definition" do
      test_definition = Definition.new("The communication of a statement that makes a false claim")
      test_definition.save
      expect(Definition.all).to eq [test_definition]
    end
  end

  describe '.all' do
    it 'list all definitions' do
      expect(Definition.all).to eq []
    end
  end

  describe '.clear' do
    it 'empties the array' do
      test_definition = Definition.new("Yearly obligations to a financial institution.")
      test_definition.save
      expect(Definition.clear).to eq []
    end
  end

  describe '#set_id' do
    it "sets id for definition" do
      test_definition = Definition.new("A writ which lies for the recovery of an estate by a personclaiming as issue in tail")
      test_definition.save
      expect(test_definition.set_id).to eq 2
    end
  end

  describe '#id' do
    it 'returns unique id' do
      test_definition = Definition.new("An investor deciding not to sell or act upon an option at the end of the contract.")
      test_definition.save
      expect(test_definition.id).to eq 1
    end
  end

  describe '#add_definition' do
    it 'allows users to add definitions' do
      test_definition = Definition.new("The communication of a statement that makes a false claim")
      test_definition = Definition.new({:vocabulary => "Defamation", :word_definition => "The communication of a statement that makes a false claim", :id => 3})
    end
  end

  describe '.find' do
    it "returns the information for a word" do
      test_definition = Definition.new("The communication of a statement that makes a false claim")
      test_definition.save
      test_definition2 = Definition.new("Yearly obligations to a financial institution.")
      test_definition2.save
      expect(Definition.find(test_definition.id)).to eq (test_definition)
    end
  end
end
