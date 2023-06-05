class Api::V0::ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def render_not_found_response(error)
    render json: ErrorSerializer.new(error), status: 404
  end

  def render_invalid_response(error)
    render json: ErrorSerializer.new(error), status: 400
  end

  def index
    render json: ArtistSerializer.new(Artist.all)
  end

  def show
    render json: ArtistSerializer.new(@artist)
  end

  def create
    artist = Artist.create!(artist_params)

    render json: ArtistSerializer.new(artist), status: 201
  end

  def update
    @artist.update!(artist_params)

    render json: ArtistSerializer.new(@artist), status: 200
  end

  def destroy
    @artist.destroy
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :email, :password, :password_confirmation, :pricing, :styles => [])
  end
end
