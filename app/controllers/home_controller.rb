# frozen_string_literal: true

class HomeController < ApplicationController

  def search
    item_id = params[:item_id]
    restaurant_id = params[:restaurant_id]
    @results = if item_id.present? && restaurant_id.present?
                 Restaurant.includes(:items).where(id: restaurant_id, items: { id: item_id })
               elsif item_id.present?
                 Item.includes(:restaurant).where(id: item_id).map(&:restaurant)
               elsif restaurant_id.present?
                 Restaurant.includes(:items).where(id: restaurant_id)
               else
                 Restaurant.includes(:items).all
               end
  end

  def show
    @item = Item.find(params[:item_id]) unless params[:item_id].blank?
  end

end
