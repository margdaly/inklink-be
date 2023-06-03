class Api::V0::DiscoverController < ApplicationController

  def index
    images = ImageFacade.new.get_images(params[:discover])
    # require 'pry'; binding.pry
    render json: ImageSerializer.new(images)
  end
end