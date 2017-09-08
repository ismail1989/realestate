require 'test_helper'

class SearchPropertyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_property_index_url
    assert_response :success
  end

end
