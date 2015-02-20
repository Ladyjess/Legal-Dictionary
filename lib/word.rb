class Word
 attr_reader :vocabulary, :definitions
  @@all_words = []

  def initialize(attributes)
    @vocabulary = attributes[:vocabulary]

end
