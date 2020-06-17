class ReviewsController < ApplicationController
  def place
    Place.find(params[:place_id])
  end

  def review
    Review.find(params[:id])
  end
  # ↑繰り返し削除の為のパブリックメソッド

  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
    @reviews = place.reviews
  end

  def edit
    place
    review
  end

  def update
    review.update(review_params)
    redirect_to controller: :places, action: :show, id: place
  end

  def destroy
    @reviews = place.reviews
    review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:review).merge(user_id: current_user.id, place_id: params[:place_id])
  end
end
