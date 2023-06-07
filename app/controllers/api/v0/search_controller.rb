class Api::V0::SearchController < ApplicationController
  def index
    if params[:city].empty?
      render json: ErrorSerializer.new('No city entered'), status: 400
    else
      shops = ShopsFacade.new.nearby_shops(params[:city])
      render json: ShopSerializer.new(shops)
    end
  end
end