class ChangeDeliveryChargeToBeIntegerInRestaurants < ActiveRecord::Migration[7.0]
  def up
    change_column :restaurants, :delivery_charge, :integer
  end

  def down
    change_column :restaurants, :delivery_charge, :string
  end
end
