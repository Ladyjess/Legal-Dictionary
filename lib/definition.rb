
  class Definition

  attr_reader :word_definition

    @@all_definitions = []

    def initialize(properties)
      @word_definition = properties[:word_definition]
      @id = @@all_definitions.length + 1
    end

    def save
      @@all_definitions.push(self)
    end

    def self.all
      @@all_definitions
    end

    def self.clear
      @@all_definitions = []
    end

    def id
      @id
    end

    # def self.find_by_def(a_definition)
    #   found_definition = nil
    #   @@all_definitions.each do |definition|
    #     if definition.word_definition == a_definition
    #       found_definition = definition
    #     end
    #   end
    #   found_definition
    # end
  end
