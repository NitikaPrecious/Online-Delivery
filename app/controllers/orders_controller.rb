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
    order = Order.new(user: current_user)
    item = Item.find(params[:item_id])
    if order.save
      if item.present?
        order_item = OrderItem.new(item: item, order: order, quantity: 1)
        order_item.save
        quantity = order_item.quantity
        order_item.update(sub_total: item.price * quantity)
      else
        item = Item.find(params[:cart_item_id])
        cartItem = CartItem.new(item: item, quantity: 1, total:item.price)
        order_item = OrderItem.new(item_id: cartItem, order: order, quantity:1)
        order_item.save
        quantity = item.quantity
        order_item.update(sub_total: item.total)
      end
      order.update(total:order_item.sub_total)
      return redirect_to orders_path
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
    @cart_item = current_user.cart_items
  end
end
