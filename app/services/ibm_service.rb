class IBMService
  def get_tone(string)
    response = conn.get '/instances/35694f05-d1b2-4c03-9773-721372d1daf0/v3/tone' do |req|
      req.params['text'] = string
      req.params['version'] = '2017-09-21'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new 'https://api.us-south.tone-analyzer.watson.cloud.ibm.com/' do |f|
      f.basic_auth('apikey', ENV['IBM_API_KEY'])
    end
  end
end
