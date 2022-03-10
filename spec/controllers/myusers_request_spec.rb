require 'rails_helper'

RSpec.describe Myuser, type: :request do
  
  it "gets all users" do
    #user = Myuser.create(email: "lp@1606.com",role: "admin",password: "laxmi@123")
    get new_myuser_registration_path
    #get myusers_path
    expect(response).to be_successful
    #expect(response.body).to include("admin")
  end

  it "user sign in successful"
    @user = FactoryBot.create(:myuser)
    sign_in @user
    expect(response).to be_successful
  end

  
end