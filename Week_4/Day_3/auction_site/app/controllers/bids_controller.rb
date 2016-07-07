class BidsController < ApplicationController

def create

  @user = User.where('email = ?', params[:bid][:email])
  if @users.first
      @bidder_id = @user.first.id
      @product = Product.find(params[:product_id])
      if (params[:bid][:amount].to_f >= @product.minbid.to_f) && (@bidder_id != @product.user_id)

        @bid = Bid.create(amount: params[:bid][:amount], product_id: params[:product_id], user_id: @bidder_id)

        redirect_to "/products/#{@product.id}"
      else
        render text: 'This bid is either too small or you are bidding on your own product'
      end
  else
    render text: "Email doesn't match"
  end
end
end
