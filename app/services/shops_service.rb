class ShopsService
  def nearby_shops(location)
    get_url("/v3/places/search?categories=11075&near=#{location}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)  
  end

  def conn 
    Faraday.new(url: "https://api.foursquare.com") do |f|
      f.headers['Authorization'] = ENV['Authorization']
    end
  end
end