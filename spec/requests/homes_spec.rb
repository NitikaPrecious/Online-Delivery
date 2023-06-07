require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'GET home#index' do
    before(:example) {get root_path} #get index
      it "it is a success" do
       expect(response).to have_http_status(:ok)
      end
      it "renders the index template" do
       expect(response).to have_http_status(302)
      end
    end
  describe 'GET home#search' do
    before(:example) {get search_path} #get search
      it "it is a success" do
       expect(response).to have_http_status(:ok)
      end
      it "renders 'search' template" do
       get '/search'
       expect(response).to have_http_status(302)
     end
    end
end
