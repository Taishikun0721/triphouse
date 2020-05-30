class ReviewsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @review = Review.new
  end

  def create
    place = Place.find(params[:place_id])
    Review.create(review_params)
    @place = Place.find(params[:place_id])
    @reviews = @place.reviews
  end

  private

  def review_params
    params.require(:review).permit(:review).merge(user_id: current_user.id, place_id: params[:place_id])
  end
end
