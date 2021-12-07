# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'WelcomePages', type: :request do
  describe 'GET /welcome' do
    it 'returns http success' do
      get '/welcome_pages/welcome'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:welcome, layout: :public)
    end
  end

  describe 'GET /about' do
    it 'returns http success' do
      get '/welcome_pages/about'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:about, layout: :public)
    end
  end

  describe 'GET /contacts' do
    it 'returns http success' do
      get '/welcome_pages/contacts'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:contacts, layout: :public)
    end
  end
end
