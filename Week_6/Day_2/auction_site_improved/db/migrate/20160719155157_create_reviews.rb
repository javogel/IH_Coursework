class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :product
      t.string :description

      t.timestamps
    end
  end
end
