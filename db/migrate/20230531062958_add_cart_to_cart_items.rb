class AddCartToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :cart, foreign_key: true
  end
end
