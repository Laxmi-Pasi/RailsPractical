require "test_helper"

class MyusersControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get home_path
    assert_response :success
  end
end
