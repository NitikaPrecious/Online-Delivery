require "test_helper"

class ItemcategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get itemcategory_index_url
    assert_response :success
  end
end
