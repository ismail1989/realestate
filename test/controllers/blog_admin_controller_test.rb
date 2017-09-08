require 'test_helper'

class BlogAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_admin_index_url
    assert_response :success
  end

end
