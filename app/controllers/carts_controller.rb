class CartsController < ApplicationController
    def index
      @cart_items=current_user.card_item
    end

    def add_to_card
     item=Item.find(params[:item_id])
     current_user.cart_items.create(item: item)
     redirect_to cart_path,notice: 'Item added to cart.'
    end

    def remove_from_cart
     item = CartItem.find(params[:item_id])
     item.destroy
     redirect_to cart_path,notice: 'Item removed from cart'
    end

    def clear_cart
     current_user.cart_items.destroy_all
     redirect_to cart_path,notic: 'Cart cleared'
    end
end
