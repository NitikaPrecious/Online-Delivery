# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart

  def show
    @cart_item = @cart.cart_items.find(params[:id])
  end

  def create
    item = Item.find(params[:cart_item_id])
    cart_item = @cart.cart_items.where(item_id: params[:cart_item_id])&.first
    all_item = cart_item || @cart.cart_items.new(item_id:item.id)
    quantity = all_item.quantity += 1
    all_item.total = item.price * quantity
    return redirect_to carts_path if all_item.save
    redirect_to root_path
  end

  def destroy

    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end