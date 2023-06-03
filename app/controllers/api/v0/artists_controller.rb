class Api::V0::ArtistsController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    require 'pry'; binding.pry
  end

  private
  def set_user
    @artist = Artist.find(params[:id])
  end
end