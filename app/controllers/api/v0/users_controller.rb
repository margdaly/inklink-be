class Api::V0::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :city, :username, :password_digest)
  end

  def render_not_found_response(error)
    render json: ErrorSerializer.serialize(error), status: 404
  end
end
