require 'rails_helper'

RSpec.describe "WelcomePages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/welcome_pages/home"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:home, layout: :application)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/welcome_pages/about"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:about, layout: :application)
    end
  end

  describe "GET /contacts" do
    it "returns http success" do
      get "/welcome_pages/contacts"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:contacts, layout: :application)
    end
  end

end
