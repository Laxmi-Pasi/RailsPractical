require "test_helper"

class FormHelperEmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get form_helper_employees_index_url
    assert_response :success
  end

  test "should get new" do
    get form_helper_employees_new_url
    assert_response :success
  end

  test "should get show" do
    get form_helper_employees_show_url
    assert_response :success
  end

  test "should get edit" do
    get form_helper_employees_edit_url
    assert_response :success
  end
end
