# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Invitations', type: :request do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe 'GET /invitations' do
    it 'returns http success' do
      get invitations_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index, layout: :application)
    end
  end
end
