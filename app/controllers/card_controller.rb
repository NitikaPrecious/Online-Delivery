class CardController < ApplicationController
    def add_item
        item = Item.find(params[:item_id])
        session[:cart] ||= []
        session[:cart] << item.id unless session[:cart].include?(item.id)
end
