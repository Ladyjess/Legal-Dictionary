class Word

  @@all_words = []

  def initialize(vocabulary)
    @vocabulary = vocabulary
    @definitions = []
    @id = set_id
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

  def set_id
    @@all_words.length + 1
  end

  def id
    @id
  end

  def vocabulary
    @vocabulary
  end

  def definitions
    @definitions
  end

  def add_definition(definition)
    @definitions.push(definition)
  end

  def self.find(word_id)
    found_word = nil
    @@all_words.each do |word|
      if word.id == word_id.to_i
        found_word = word
      end
    end
    found_word
  end
end












#
#
# HASH INITIAIZATION
#
#
#
# class Word
#  attr_reader :vocabulary
#   @@all_words = []
#
#   def initialize(properties)
#     @vocabulary = properties[:vocabulary]
#     @definitions = []
#     @id = set_id
#   end
#
#   def save
#     @@all_words.push(self)
#   end
#
#   def self.all
#     @@all_words
#   end
#
#   def self.clear
#     @@all_words = []
#   end
#
#   def set_id
#     @@all_words.length + 1
#   end
#
#   def id
#     @id
#   end
#
#   def definitions
#     @definitions
#   end
#
#   def add_definition(definition)
#     @definitions.push(definition)
#   end
#
#   def self.find(word_id)
#     found_word = nil
#     @@all_words.each do |word|
#       if word.id == word_id.to_i
#         found_word = word
#       end
#     end
#     found_word
#   end
# end
