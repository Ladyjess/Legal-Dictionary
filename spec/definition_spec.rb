require "rspec"
require "definition"


describe Definition do
  before do
    Definition.clear
  end

  describe "#save" do
    it "saves a new definition" do
      test_definition = Definition.new({:word_definition => "The communication of a statement that makes a false claim"})
      expect(test_definition.save).to eq ([test_definition])
    end
  end

  describe '.all' do
    it 'list all definitions' do
      expect(Definition.all).to eq []
    end
  end

  describe '.clear' do
    it 'empties the array' do
      test_definition = Definition.new({:word_definition => "Yearly obligations to a financial institution."})
      test_definition.save
      Definition.clear
      expect(Definition.all).to eq []
    end
  end


  describe '#id' do
    it 'returns unique id' do
      test_definition = Definition.new({:word_definition => "An investor deciding not to sell or act upon an option at the end of the contract."})
      test_definition.save
      expect(test_definition.id).to eq (1)
    end
  end

  describe 'word_definition' do
    it 'gives definition information' do
      test_definition = Definition.new({:word_definition => "Yearly obligations to a financial institution."})
      test_definition.save
      expect(test_definition.word_definition).to eq ("Yearly obligations to a financial institution.")
    end
  end

  # describe '.find_by_def' do
  #   it "returns the information for a word" do
  #     test_definition = Definition.new({:word_definition => "The communication of a statement that makes a false claim"})
  #     test_definition.save
  #     test_definition2 = Definition.new({:word_definition => "Yearly obligations to a financial institution."})
  #     test_definition2.save
  #     expect(Definition.find_by_def("Yearly obligations to a financial institution.")).to eq (test_definition2)
  #   end
  # end
end
