require "test_helper"
require "myproduct"

class MyproductTest < ActiveSupport::TestCase
  def setup
    @user = Myuser.new(email: "xyz@123",role: "admin",password: "laxmi@123")
    @user.save
    @product = @user.myproducts.new(name: "abc", price: "600")
  end

  test "attributes should be valid" do
    assert @product.valid?
  end

  test "should not save without name" do
    @product.name = ""
    assert_not @product.valid?
  end
  
  test "should not save without price" do
    @product.price = ""
    assert_not @product.valid?
  end

  test "should not save without myuser_id" do
    @product.myuser_id = ""
    assert_not @product.valid?
  end

end
