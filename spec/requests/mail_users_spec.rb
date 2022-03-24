require 'rails_helper'

RSpec.describe "MailUsers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/mail_users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/mail_users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/mail_users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/mail_users/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
