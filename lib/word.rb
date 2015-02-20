class Word
 attr_reader :vocabulary, :definitions
  @@all_words = []

  def initialize(attributes)
    @vocabulary = attributes[:vocabulary]
    @defintitions = []
    @id = @@all_words.length + 1
  end

  def save
    @@all_words.push(self)
  end

  def self.all
    @@all_words
  end

  def self.clear
    @@all_words = []
  end

  def id
    @id
  end

  def add_definition(new_definition)
    @definitions.push(new_definition)
  end

  def self.find_word(identification)
    found_word = nil
    @@all_words.each do |word|
      if word.id == identification
        found_word = word
      end
    end
    found_word
  end
end
