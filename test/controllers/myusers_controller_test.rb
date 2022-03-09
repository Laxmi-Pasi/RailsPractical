require "test_helper"

class MyusersControllerTest < ActionDispatch::IntegrationTest

  # def setup
  #   @user = Myuser.new(email: "abc@123",role: "admin",password: "laxmi@123")
  # end

  # test "should get index" do
  #   get myusers_path
  #   assert_response :success
  # end

  test "should get home" do
    get home_path
    assert_response :success
  end

  # test "should create user" do
  #   assert_difference('Myuser.count') do
  #     post myusers_path, params: {myuser: {email: @user.email, role: @user.role, password: @user.password}}
  #   end
  #   assert_redirected_to myusers_path(User.last)
  # end

end
