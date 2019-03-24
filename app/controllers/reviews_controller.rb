class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end

  def create
    review = current_user.reviews.create(review_params)
    if review.save
      redirect_to :back
    else
      render :back
    end
  end

  private
  def review_params
    params.require(:review)
    params.permit(:product_id).merge(params.require(:review).permit(:rating, :description))
  end

end
