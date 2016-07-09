class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validate :bid_cannot_be_lower_than_minbid_or_last, :bid_cannot_be_by_same_user


  def bid_cannot_be_lower_than_minbid_or_last
    product = Product.find(product_id)
    if product.bid.last
      last_bid = product.bid.last.amount
    else
      last_bid = 0
    end
    minbid = product.minbid
    if amount < minbid || amount < last_bid
      errors.add(:amount, "can't be lower than minimum bid or last bid")
    end
  end

  def bid_cannot_be_by_same_user
    product = Product.find(product_id)
    product_creator = product.user_id
    if user_id == product_creator
      errors.add(:bid, "cannot come from owner of product")
    end
  end

end
