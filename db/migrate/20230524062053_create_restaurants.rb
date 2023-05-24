class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phone_1
      t.string :phone_2
      t.string :minimum_order
      t.string :delivery_charge
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
