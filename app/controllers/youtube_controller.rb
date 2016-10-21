module Youtube
  include HTTParty
  KEY=ENV['YOUTUBE_KEY']

  def self.get_id(query)
    url="https://www.googleapis.com/youtube/v3/search?key=#{KEY}&type=video&part=snippet&maxResults=1&q=how to play #{query}"

    response = HTTParty.get(url)
    parsed_response = response.parsed_response
    parsed_response['items'].first['id']['videoId']
  end
end
