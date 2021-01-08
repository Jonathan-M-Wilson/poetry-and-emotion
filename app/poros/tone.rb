class Tone
  attr_reader :tones

  def initialize(data)
    @tones = data[:document_tone][:tones]
  end

  def tone
    @tones.reduce([]) do |acc, tone|
      acc << tone[:tone_name]
    end
  end
end
