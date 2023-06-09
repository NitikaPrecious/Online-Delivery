require 'rails_helper'

RSpec.describe "Orders", type: :request do
 
  describe "GET index" do
    it "assigns all Orders as order" do
      order = Order.create[:order]
    end
  end
  it "when all Orders as order " do
    get orders_path 
     expect(response).to have_http_status(302)
    end

  describe "GET show" do
    it "show a order" do
      restaurant=FactoryBot.create(:restaurant)
      user= FactoryBot.create(:user)
      sign_in user
      @order = FactoryBot.create(:order,restaurant:restaurant,user:user)
      get order_path(@order) 
      expect(response).to have_http_status(302)
    end
  end

  describe "POST create" do
    it "create order " do
      restaurant=FactoryBot.create(:restaurant)
      user= FactoryBot.create(:user)
      sign_in user
      get orders_path
     expect(response).to have_http_status(302)
    end
  end

  describe "delete destroy" do
    it "destroy order " do
      restaurant=FactoryBot.create(:restaurant)
      user= FactoryBot.create(:user)
      sign_in user
      @order = FactoryBot.create(:order,restaurant:restaurant,user:user)
      get order_path(@order)
     expect(response).to have_http_status(302)
    end
  end

end
