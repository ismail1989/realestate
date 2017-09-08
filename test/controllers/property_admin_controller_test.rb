require 'test_helper'

class PropertyAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get property_admin_index_url
    assert_response :success
  end

end
