class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.float :amount
    end
  end
end
