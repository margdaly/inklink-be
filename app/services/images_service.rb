class ImagesService
  def get_images(search)
    get_url("/images/search?q=#{search}&count=15")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://bing-image-search1.p.rapidapi.com') do |faraday|
      faraday.headers['X-RapidAPI-Key'] = ENV['X_RapidAPI_Key']
      faraday.headers['X-RapidAPI-Host'] = ENV['X_RapidAPI_Host']
    end
  end
end
