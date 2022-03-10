require 'rails_helper'

RSpec.describe User, type: :request do
  
  before do
    @user = FactoryBot.create(:myuser)
    sign_in @user
  end
  
  it "get index" do
    get myproducts_path
    expect(response).to be_successful
  end

  it "get new " do
    product = FactoryBot.create(:myproduct)
    get new_myproduct_path(product)
    expect(response).to be_successful
  end
  
  it "get show " do
    product = FactoryBot.create(:myproduct)
    get myproduct_path(product)
    expect(response).to be_successful
  end

  it "get edit " do
    product = FactoryBot.create(:myproduct)
    get edit_myproduct_path(product)
    expect(response).to be_successful
  end

  it "should delete" do
    product = FactoryBot.create(:myproduct)
    product.destroy
    #delete "/myproducts/#{product.id}"
    expect(Myproduct.find_by(name:"toy car")).to be_nil
  end

end