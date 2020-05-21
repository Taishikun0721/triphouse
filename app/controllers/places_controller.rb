class PlacesController < ApplicationController
  def index
    @place = Place.all
  end
end
