require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe 'GET home#index' do
      it "it is a success" do
      get root_path #get index
       expect(response).to have_http_status(302)
      end
      context "authenticated" do 
        before(:each) do 
          user = FactoryBot.create(:user)
          sign_in user
        end
      end
    end
  describe 'GET home#search' do
    context "authenticated" do 
      before(:each) do 
        user = FactoryBot.create(:user)
        sign_in user
      end 
    end
      it "it is a success" do
       expect(response).to have_http_status(:ok)
      end
      it "renders 'search' template" do
       get '/search'
       expect(response).to render_template('search')
     end
    end
  end