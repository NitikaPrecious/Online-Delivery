class CartsController < ApplicationController
  before_action :authenticate_user!
  def index
    @carts = current_user.cart.cart_items
  end
end
