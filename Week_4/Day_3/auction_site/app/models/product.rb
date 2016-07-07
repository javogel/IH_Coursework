class Product < ApplicationRecord
  belongs_to :user
  has_many :bid
  accepts_nested_attributes_for :bid

  def highestbidder
    highest_bid = self.bid.order("amount DESC").first

    if highest_bid
      bidder = User.where('id = ?', highest_bid.user_id).first
      biddername = bidder.name
      return biddername
    else
      return "**No highest bid**"
    end
  end
end
