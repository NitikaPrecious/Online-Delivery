class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_no
      t.references :user, null: false, foreign_key: true
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.string :address
      t.string :city
      t.integer :delivery_charges

      t.timestamps
    end
  end
end
