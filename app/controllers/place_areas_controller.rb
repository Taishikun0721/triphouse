class PlaceAreasController < ApplicationController

  def index
    @place_areas = Place_area.all
  end

  def show
    @place_ara = Place_area.find(params[:id])
  end
end
