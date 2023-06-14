class CartsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cartItems = current_user.cart_items
  end
end
