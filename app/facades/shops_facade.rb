class ShopsFacade
  def nearby_shops(location)
    results = service.nearby_shops(location)

    results[:results].map do |shop_data|
      Shop.new(shop_data)
    end
  end

  private
  def service 
    @service ||= ShopsService.new
  end
end