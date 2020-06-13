class PlaceAreasController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  def index
    @place_areas = PlaceArea.all
  end

  def show
    @place_area = PlaceArea.find(params[:id])
  end
end
