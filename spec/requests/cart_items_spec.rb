require 'rails_helper'

RSpec.describe "CartItems", type: :request do
  describe "POST create" do
    it "create cart itemss " do
      item_category= FactoryBot.create(:item_category)
      restaurant=FactoryBot.create(:restaurant)
      @item = FactoryBot.create(:item,item_category:item_category,restaurant:restaurant)
      user= FactoryBot.create(:user)
      sign_in user
      @cart = FactoryBot.create(:cart,user:user)
      @cart_item = FactoryBot.create(:cart_item,item:@item,cart:@cart)
     get cart_items_path(@cart_item)
     expect(response).to have_http_status(302)
    end
  end

  describe "delete destroy" do
    it "destroy cart itemss " do
      item_category= FactoryBot.create(:item_category)
      restaurant=FactoryBot.create(:restaurant)
      @item = FactoryBot.create(:item,item_category:item_category,restaurant:restaurant)
      user= FactoryBot.create(:user)
      sign_in user
      @cart = FactoryBot.create(:cart,user:user)
      @cart_item = FactoryBot.create(:cart_item,item:@item,cart:@cart)
     get cart_item_path(@cart_item)
     expect(response).to have_http_status(302)
    end
  end

end
