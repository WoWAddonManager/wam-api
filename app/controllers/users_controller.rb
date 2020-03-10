class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show]
  # before_action :user_params, only: %i[:show]


  def show
    render json: User.find_by({id: params[:id]})
  end


  private

  def authenticate_user!
    @user = User.find_by({id: params[:id]})
    if @user.tokens.has_key?(params[:token])
      render json: @user
    else

    end
  end

  def user_params
    params.require(:user).permit(:name, :addons, :id, :uid, :tokens)
  end

end
