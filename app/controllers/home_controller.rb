class HomeController < ApplicationController
  def index
    render
  end
  
  def search
    item_id = params[:item_id]
    restaurant_id = params[:restaurant_id]
  
    if item_id.present? && restaurant_id.present?
      @results = Restaurant.includes(:items, :orders).where(id: restaurant_id, items: { id: item_id })
    elsif item_id.present?
      @results = Item.includes(restaurant: :orders).where(id: item_id).map(&:restaurant)
    elsif restaurant_id.present?
      @results = Restaurant.includes(:items, :orders).where(id: restaurant_id)
    else
      @results = Restaurant.includes(:items, :orders).all
    end
  end

  def show
    @item = Item.find(params[:item_id]) unless params[:item_id].blank?


  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
