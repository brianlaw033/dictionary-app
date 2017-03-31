class Word
  @@words = []

  attr_reader(:word, :id, :definitions)

  def initialize(word)
    @word = word
    @id = @@words.length + 1
    @definitions = []
  end

  def self.all()
    @@words
  end

  def self.clear()
    @@words = []
  end

  def save()
    @@words.push(self)
  end

  def self.find(id)
    found_word=""
    @@words.each do |word|
      if word.id == id
        found_word = word
      end
    end
    found_word
  end

  def add_def(definition)
    @definitions.push(definition)
  end

end
