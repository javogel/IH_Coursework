class BidsController < ApplicationController

def create
  @user = User.where('email = ?', params[:bid][:email])
  @bidder_id = @user.first.id
  @product = Product.find(params[:bid][:product_id])
  if (params[:bid][:amount] > @product.minbid) && (@bidder_id != @product.user_id)
    @bid = Bid.create(amount: params[:bid][:amount], product_id: params[:bid][:product_id], user_id: @bidder_id)
  else
    render text: 'This bid is either too small or you are bidding on your own product, child'
  end
  redirect_to '/products'
end
end
