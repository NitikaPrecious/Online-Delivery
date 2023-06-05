class CartsController < ApplicationController
  def index
    @carts = current_user.cart.cart_items
  end
end
