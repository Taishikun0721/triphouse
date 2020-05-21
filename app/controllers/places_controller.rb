class PlacesController < ApplicationController
  def index
    @place = Place.page(params[:page]).per(18)
  end
end
