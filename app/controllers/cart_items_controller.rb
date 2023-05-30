# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart

  def index
  end

  def create
    item = Item.find(params[:item])
    cartItem = CartItem.new(item:item, user:current_user, quantity:1, total:item.price)
    if cartItem.save
      redirect_to cart_items_path
    else
      redirect_to root_path
    end
  end

  def destroy
    cart_item = @cart.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def set_cart
    
    @cart = current_user.cartItem
  end
end
