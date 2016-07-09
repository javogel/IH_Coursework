class User < ApplicationRecord
  has_many :products
  has_many :bids
  validates :email, presence: true, uniqueness: true
end
