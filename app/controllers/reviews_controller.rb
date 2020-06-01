class ReviewsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @review = Review.new
  end

  def create
    Review.create(review_params)
    @place = Place.find(params[:place_id])
    @reviews = @place.reviews
  end

  def edit
    @place = Place.find(params[:place_id])
    @review = Review.find(params[:id])
  end

  def update
    @place = Place.find(params[:place_id])
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to controller: :places, action: :show, id: @place
  end

  def destroy
    review = Review.find(params[:id])
    @place = Place.find(params[:place_id])
    review.destroy
    redirect_to controller: :places, action: :show, id: @place
  end

  private

  def review_params
    params.require(:review).permit(:review).merge(user_id: current_user.id, place_id: params[:place_id])
  end
end
