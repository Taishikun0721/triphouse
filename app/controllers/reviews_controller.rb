class ReviewsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @review = Review.new
  end

  def create
    Review.create(review_params)
    redirect_to root_path
    flash[:success] = "レビューを投稿しました"
  end

  private

  def review_params
    params.require(:review).permit(:review).merge(user_id: current_user.id, place_id: params[:place_id])
  end
end
