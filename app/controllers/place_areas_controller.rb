class PlaceAreasController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  before_action :show_user_icon

  def show_user_icon
    @user = User.find(current_user.id) if user_signed_in?
  end

  def index
    @place_areas = PlaceArea.all
  end

  def show
    @place_area = PlaceArea.find(params[:id])
  end
end
