# frozen_string_literal: true

class RestaurantsController < ApplicationController
  def index
    if params[:query].blank?
      @restaurants = Restaurant.all
    else
      @query = params[:query]
      @restaurants = Restaurant.where('lower(name) LIKE ?', "%#{@query}%")
    end
  end

  def search
    @restaurants = Restaurant.where('name Like ?', "%#{params[:query]}%")
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
