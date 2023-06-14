class ToChange < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cart_items, :cart, index: true
    add_reference :cart_items, :user, index: true
    drop_table :carts
    remove_reference :order_items, :cart_item, index: true
    add_reference :order_items, :item, index: true
    
  end
end
