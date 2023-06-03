class Api::V0::ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_not_found_response(error)
    render json: ErrorSerializer.new(error), status: 404
  end

  def show
    render json: ArtistSerializer.new(@artist)
  end

  private
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.permit(:name, :username, :password_digest, :styles, :pricing, :contact_info)
  end
end