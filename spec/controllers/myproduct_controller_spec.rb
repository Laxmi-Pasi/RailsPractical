require 'rails_helper'

RSpec.describe MyproductsController, type: :controller do
 
  before do
    @user = FactoryBot.create(:myuser)
  end
  it "renders the index template" do
    sign_in @user
    get :index
    expect(response).to be_successful
  end

end
