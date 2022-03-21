require "test_helper"
require "myuser"

class MyuserTest < ActiveSupport::TestCase
  def setup
    @user = Myuser.new(email: "abc@123",role: "admin",password: "laxmi@123")
  end

  test "attributes should be valid" do
    assert @user.valid?
  end

  test "should not save without email" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "should not save without password" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "should not save without role" do
    @user.role = ""
    assert_not @user.valid?
  end

end
