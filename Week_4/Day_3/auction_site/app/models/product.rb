class Product < ApplicationRecord
  belongs_to :user
  has_many :bid


  def highestbidder
    highest_bid = self.bid.order("amount DESC").first

    if highest_bid
      biddername = User.where('id = ?', highest_bid.id).first.name
      return biddername
    else
      return "**No highest bid**"
    end
  end
end
