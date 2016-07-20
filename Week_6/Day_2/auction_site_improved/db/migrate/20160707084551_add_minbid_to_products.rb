class AddMinbidToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :minbid, :float
  end
end
