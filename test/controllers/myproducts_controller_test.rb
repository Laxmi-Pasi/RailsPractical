require "test_helper"

class MyproductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = Myuser.new(email: "xyz@123",role: "admin",password: "laxmi@123")
    @user.save
    @product = @user.myproducts.new(name: "abc", description: "abc desc", price: "600")
    @product.save
  end

  setup do
    get '/myusers/sign_in'
    sign_in myusers(:myuser_001)
    post myuser_session_url
  end
  
  test "should get index" do
    get myproducts_path
    assert_response :success
  end

  test "should get new" do
    get new_myproduct_path
    assert_response :success
  end

  test "should get edit" do
    get edit_myproduct_path(@product.id)
    assert_response :success
  end

  test "should get show" do
    get myproduct_path(@product.id)
    assert_response :success
  end

  test "should get delete" do
    #delete "/myproducts/#{@product.id}"
    @product.destroy
    assert_nil( @product )
  end

end
