require "test_helper"

class MyproductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = Myuser.new(email: "xyz@123",role: "admin",password: "laxmi@123")
    @user.save
    @product = @user.myproducts.new(name: "computer", description: "abc desc", price: "600")
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

  test "should create product" do
    assert_difference('Myproduct.count') do
      post myproducts_path, params: { myproduct: {name: "Keyboard", description: "abc desc", price: "600", myuser_id: @user.id }}
    end
    assert_redirected_to myproduct_path(Myproduct.last)
  end

  test "should get edit" do
    get edit_myproduct_path(@product.id)
    assert_response :success
  end

  test "should get show" do
    get myproduct_path(@product.id)
    assert_response :success
  end

  test "should update product" do
    #binding.pry
    @product.update(:name => "Mouse")
    #binding.pry
    assert Myproduct.find_by(name: 'Mouse')
    assert_equal "Mouse", @product.name
  end

  test "should get delete" do
    delete myproduct_path(@product)
    assert_nil(Myproduct.find_by(name:"computer"))
  end
end
