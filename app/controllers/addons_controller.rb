# frozen_string_literal: true

# Handles /api/addons api route
class AddonsController < ApplicationController
  before_action :set_addon, except: %i[index create]
  before_action :addon_params, only: %i[index]

  # GET /addons
  def index
    puts "Name: #{params[:name].class}"
    if params[:name] == nil 
      @addons = Addon.all
    else
      @addons = Addon.find_by(name: params[:name].to_s);
    end

    render json: @addons
  end

  # GET /addons/1
  def show
    render json: @addon
  end

  # POST /addons
  def create
    # TODO: This is needs to get based on login/api key?
    @user = User.find_by(id: '5e4b19bc098ef0565e6d0f5e')
    @addon = @user.addons.create(addon_params)
    if @addon.save
      render json: @addon, status: :created, location: @addon
    else
      render json: @addon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addons/1
  def update
    if @addon.update
      render json: @addon
    else
      render json: @addon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addons/1
  def destroy
    @addon.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_addon
    @addon = Addon.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def addon_params
    params.permit(:id, :name, :token, :addon)
  end
end
