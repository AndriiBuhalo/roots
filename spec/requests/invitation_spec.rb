# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Invitations', type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  describe 'GET /invitations' do
    it 'returns http success' do
      get invitations_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index, layout: :application)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get invitations_new_path
      expect(response).to have_http_status(:moved_permanently)
      expect(response).to redirect_to(new_user_invitation_url)
    end
  end
end
