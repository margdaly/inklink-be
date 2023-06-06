class Api::V0::SearchController < ApplicationController
  def index
    shops = ShopsFacade.new.nearby_shops(params[:city])
    render json: ShopSerializer.new(shops)
  end
end