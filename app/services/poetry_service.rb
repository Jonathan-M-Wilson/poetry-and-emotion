class PoetryService
  class << self
    def get_poems(author)
      result = get_json("/author/#{author}")
      result[0..9]
    end

    def conn
      private
      Faraday.new(url: 'https://poetrydb.org')
    end

    def get_json(url)
      private
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
