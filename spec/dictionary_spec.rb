require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word') do
    it("returns the word") do
      test_word = Word.new("Gabriel")
      expect(test_word.word()).to(eq("Gabriel"))
    end
  end

  describe('#id') do
    it("returns the id of the word") do
      test_word = Word.new("Gabriel")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe ('#all') do
    it ('return all word') do
      test_word = Word.new("Gabriel")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end


  describe(".find") do
    it("returns a word by its id number") do
      test_word = Word.new("Gabriel")
      test_word.save()
      test_word2 = Word.new("Richard")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe('#add_def') do
    it("adds a new definition to a word") do
      test_word = Word.new("Gabriel")
      test_definition = Definition.new("Hunter")
      test_word.add_def(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end
end
