class SearchResultsFacade
  class << self
    def get_poems(author)
      poems = PoetryService.get_poems(author)
      poems.map do |poem_data|
        Poem.new(poem_data)
      end
    end

    def get_tone(string)
      data = IBMService.new.get_tone(string)
      Tone.new(data)
    end
  end
end
