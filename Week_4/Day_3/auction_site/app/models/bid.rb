class Bid < ApplicationRecord
  belongs_to :product
  has_one :user
end
