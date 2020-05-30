class PlacesController < ApplicationController

  def index
    @places = Place.page(params[:page]).per(18)
  end

  def show
    @place = Place.find(params[:id])
    @review = Review.new
    @reviews = @place.reviews
  end
end
