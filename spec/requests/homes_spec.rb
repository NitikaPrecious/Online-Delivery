require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe 'GET home#index' do
    context "authenticated" do 
        before(:each) do 
          user = FactoryBot.create(:user)
          sign_in user
        end
        it "when user is sign in " do
          get root_url #get index
           expect(response).to have_http_status(302)
          end
        end
          it " when user is not sign in" do
            get root_path #get index
             expect(response).to redirect_to(new_user_session_path)
         end
     end
     describe 'GET home#search' do
      context "authenticated" do 
          before(:each) do 
            user = FactoryBot.create(:user)
            sign_in user
          end
          it "when user is sign in " do
            get search_path #get index
             expect(response).to have_http_status(302)
            end
          end
          describe "GET show" do
            it "assigns all itemss as @items" do
              restaurant= FactoryBot.create(:restaurant)
              item_category=FactoryBot.create(:item_category)
              @item = FactoryBot.create(:item,item_category:item_category,restaurant:restaurant)
             get item_path(@item)
             expect(response).to have_http_status(302)
            end
          end
       end
  end
 