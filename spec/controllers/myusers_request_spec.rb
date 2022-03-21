require 'rails_helper'

RSpec.describe Myuser, type: :request do
  
  it "get new path" do
    get new_myuser_registration_path
    expect(response).to be_successful
  end

end
