# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!, :set_cart_items

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(user: current_user, restaurant: Item.find(params[:cart_item_id]).restaurant)
    if order.save
      if cartItem = @cart_item.where(item_id: params[:cart_item_id])&.last
        order_item = OrderItem.new(cart_item: cartItem, order: order,quantity:1)
        order_item.save
        quantity = order_item.quantity
        order_item.update(sub_total: cartItem.item.price * quantity)
      else
        item = Item.find(params[:cart_item_id])
        cartItem = CartItem.new(item: item, quantity: 1, total:item.price)
        order_item = OrderItem.new(cart_item_id: cartItem, order: order, quantity:1)
        order_item.save
        quantity = item.quantity
        order_item.update(sub_total: cartItem.total)
      end
      order.update(total:order_item.sub_total)
      redirect_to orders_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.destroy

    redirect_to orders_path, status: :see_other
  end

  private

  def set_cart_items
    @cart_item = current_user.cart.cart_items
  end
end
