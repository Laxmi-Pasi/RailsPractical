require "test_helper"

class MycustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mycustomers_index_url
    assert_response :success
  end

  test "should get edit" do
    get mycustomers_edit_url
    assert_response :success
  end

  test "should get create" do
    get mycustomers_create_url
    assert_response :success
  end
end
