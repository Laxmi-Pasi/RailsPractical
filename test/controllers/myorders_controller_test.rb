require "test_helper"

class MyordersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myorders_index_url
    assert_response :success
  end

  test "should get edit" do
    get myorders_edit_url
    assert_response :success
  end

  test "should get show" do
    get myorders_show_url
    assert_response :success
  end

  test "should get new" do
    get myorders_new_url
    assert_response :success
  end
end
