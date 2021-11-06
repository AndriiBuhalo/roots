require 'rails_helper'

RSpec.describe "WelcomePages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/welcome_pages/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/welcome_pages/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contacts" do
    it "returns http success" do
      get "/welcome_pages/contacts"
      expect(response).to have_http_status(:success)
    end
  end

end
