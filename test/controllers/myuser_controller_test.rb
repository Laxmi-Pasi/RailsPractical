require "test_helper"

class MyuserControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get myuser_home_url
    assert_response :success
  end
end
