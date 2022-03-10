require 'rails_helper'

RSpec.describe MyproductsController, type: :controller do
  # describe "GET /" do
  #   myuser_session_path
  
  #   context "from login user" do
  #     it "should return 200:ok" do
  #       get :index
  #       expect(response).to have_http_status(:success)
  #       #expect(response.body).to include("admin")
  #     end
  #   end
  # end

  before do
    @user = FactoryBot.create(:myuser)
  end
  it "renders the index template" do
    sign_in @user
    get :index
    expect(response).to be_successful
  end

  # it "renders the new template" do
  #   post :new
  #   expect(response).to render_template("new")
  # end

  # it "should create user" do
  #     expect do
  #     post :create, :params => {:user => {email: "abc@test.com", first_name: "test123", last_name: "abc", password: "12345", contact: 1234}} 
  #     end.to change(User, :count)
  # end

end