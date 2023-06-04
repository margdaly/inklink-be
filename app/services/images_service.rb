class ImagesService
  def get_images(search)
    get_url("/api/Search/ImageSearchAPI?q=#{search}&pageNumber=1&pageSize=15&autoCorrect=true")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://contextualwebsearch-websearch-v1.p.rapidapi.com') do |faraday|
      faraday.headers['X-RapidAPI-Key'] = ENV['X-RapidAPI-Key']
      faraday.headers['X-RapidAPI-Host'] = ENV['X-RapidAPI-Host']
    end
  end
end
