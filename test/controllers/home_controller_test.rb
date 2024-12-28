require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get home_index_url
    assert_response :success
  end
end
