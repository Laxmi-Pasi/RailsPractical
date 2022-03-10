require 'rails_helper'
require 'myuser'

RSpec.describe Myuser, type: :model do
  before do
    @user = Myuser.new(email: "pqyret@123",role: "admin",password: "laxmi@123")
    @user.save
  end
  
  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is not valid without a email" do
    @user.email = ""
    expect(@user).to_not be_valid
  end

  it "is not valid without a password" do
    @user.password = ""
    expect(@user).to_not be_valid
  end
  
  it "is not valid without a role" do
    @user.role = ""
    expect(@user).to_not be_valid
  end

  let(:myuser) { build(:myuser) }

  it "factory bot" do
    user = FactoryBot.create(:myuser)
    expect(user).to be_valid
  end
end