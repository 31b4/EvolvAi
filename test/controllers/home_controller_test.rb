require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get profiles" do
    get home_index_url
    assert_response :success
  end
end
