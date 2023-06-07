class ChangeTotalToBeIntegerInOrders < ActiveRecord::Migration[7.0]
  def up
    change_column :orders, :total, :decimal
  end

  def down
    change_column :orders, :total, :string
  end
end
