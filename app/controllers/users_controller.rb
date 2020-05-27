class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show]

  # before_action :user_params, only: %i[:show]
  DeviseTokenAuth::Concerns::SetUserByToken

  def show
    render json: User.find_by({id: params[:id]})
  end

  private


  def user_params
    params.require(:user).permit(:name, :addons, :id, :uid, :tokens)
  end

end
