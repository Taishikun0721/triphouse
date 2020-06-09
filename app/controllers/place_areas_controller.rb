class PlaceAreasController < ApplicationController
  def index
    @place_areas = PlaceArea.all
  end

  def show
    @place_area = PlaceArea.find(params[:id])
  end
end
