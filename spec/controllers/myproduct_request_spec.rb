require 'rails_helper'

RSpec.describe User, type: :request do
  
  before do
    @user = FactoryBot.create(:myuser)
    sign_in @user
    @product = FactoryBot.create(:myproduct)
  end
  
  it "get index" do
    get myproducts_path
    expect(response).to be_successful
  end

  it "get new " do
    get new_myproduct_path(@product)
    expect(response).to be_successful
  end
  
  it "get show " do
    get myproduct_path(@product)
    expect(response).to be_successful
  end

  it "get edit " do
    get edit_myproduct_path(@product)
    expect(response).to be_successful
  end

  it 'checks that a product can be updated' do
    @product.update(:name => "CPU")
    expect(Myproduct.find_by_name("CPU")).to eq(@product)
  end

  it "should get create" do
    expect do
      post '/myproducts', params: { myproduct: { name: "abcd", description: "abc desc", price: "600", myuser_id: @user.id } }
      end.to change(Myproduct, :count).by(1)
    expect(response).to have_http_status(:redirect)  
  end

  it "should delete" do
    @product.destroy
    expect(Myproduct.find_by(name:"toy car")).to be_nil
  end
end
