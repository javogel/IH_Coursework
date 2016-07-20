class ReviewsController < ApplicationController



  def create

    @review = Review.new(description: params[:review][:description], product_id: params[:product_id], user_id: current_user.id)

    @review.save
    redirect_to :back
  end


  def destroy
      @review = Review.find(params[:review_id])
      
    if current_user.id == @review.user_id
      @review.destroy
    end

    redirect_to :back
  end

end
