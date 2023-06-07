class ChangeMinimumOrderToBeIntegerInRestaurants < ActiveRecord::Migration[7.0]
  def up
    change_column :restaurants, :minimum_order, :integer
  end

  def down
    change_column :restaurants, :minimum_order, :string
  end
end
