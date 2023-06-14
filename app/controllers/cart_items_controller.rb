# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :authenticate_user!


  def create 
    item = Item.find(params[:cart_item_id])
    cart_item = current_user.cart_items.where(item_id: params[:cart_item_id])&.first
    all_item = cart_item || current_user.cart_items.new(item_id:item.id)
    quantity = all_item.quantity += 1
    all_item.total = item.price * quantity
    return redirect_to carts_path if all_item.save
    redirect_to root_path
  end

  def destroy
    @cart_item = current_user.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def order
    cart_items = current_user.cart_items
    @total_sum = cart_items.pluck(:total).inject(:+)
    order= Order.create(user:current_user,total: @total_sum)
    if order.save
      cart_items.each do |cartItem|
      order.order_items.create(order_id:order,item_id: cartItem.item_id,quantity: cartItem.quantity,sub_total:cartItem.total)
      end
      cart_items.destroy_all
      # redirect_to order_cart_item_path(cart_item_id: @cartItems )
      redirect_to orders_path(order)
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end
  #   user= current_user
  #   cart_items = user.cart_items
  #   #@total_sum = cart_items.pluck(:sub_total).inject(:+)
  #   order= Order.create(user:user)
  #   if order.save
  #   cart_items.each do |cart_item|
  #     order.order_items.create(name: cart_item.item.name, price: cart_item.price,quantity: cart_item.quantity)
  #   end 
  # end

  #   @cart_items.destroy_all
  #   redirect_to orders_path(order)
  # end
end