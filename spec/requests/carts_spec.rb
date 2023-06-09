require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET index" do
    it "show cart" do
      user= FactoryBot.create(:user)
      sign_in user
      @cart = FactoryBot.create(:cart,user:user)
     get carts_path(@cart)
     expect(response).to have_http_status(302)
    end
  end
end
