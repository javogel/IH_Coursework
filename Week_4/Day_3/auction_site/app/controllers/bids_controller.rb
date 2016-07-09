class BidsController < ApplicationController

def create
  @user = User.find(session[:current_user_id])
  if @user
      @bidder_id = @user.id
      @product = Product.find(params[:product_id])
      
      if (params[:bid][:amount].to_f >= @product.minbid.to_f) && (@bidder_id != @product.user_id)

        @bid = Bid.create(amount: params[:bid][:amount], product_id: params[:product_id], user_id: @bidder_id)

        redirect_to "/products/#{@product.id}"
      else
        render text: 'This bid is either too small or you are bidding on your own product'
      end
  else
    render text: "You must log on to bid"
  end
end
end
