require 'rails_helper'

RSpec.describe "Items", type: :request do

  describe "GET index" do
    it "assigns all itemss as @items" do
      item = Item.create[:item]
    end
  end
  it "when show all items " do
    get items_path 
     expect(response).to have_http_status(302)
    end

  describe "GET show" do
    it "show a item" do
      restaurant= FactoryBot.create(:restaurant)
      item_category=FactoryBot.create(:item_category)
      @item = FactoryBot.create(:item,item_category:item_category,restaurant:restaurant)
     get item_path(@item)
     expect(response).to have_http_status(302)
    end
  end
end
