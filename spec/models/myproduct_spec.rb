require 'rails_helper'
require 'myproduct'

RSpec.describe Myuser, type: :model do
  
  before do
    @user = Myuser.new(email: "xyz@123",role: "admin",password: "laxmi@123")
    @user.save
    @product = @user.myproducts.new(name: "abc", price: "600")
    @product.save
  end
  
  it "is valid with valid attributes" do
    expect(@product).to be_valid
  end

  it "is not valid without a name" do
    @product.name = ""
    expect(@product).to_not be_valid
  end

  it "is not valid without a price" do
    @product.price = ""
    expect(@product).to_not be_valid
  end
  
  it "is not valid without a myuser id" do
    @product.myuser_id = ""
    expect(@product).to_not be_valid
  end

  let(:myproduct) { build(:myproduct) }
  
  it "factory bot" do
    product = FactoryBot.create(:myproduct)
    expect(product).to be_valid
  end
end
