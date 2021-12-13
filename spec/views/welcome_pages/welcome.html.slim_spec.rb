# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/welcome.html.slim', type: :view do
  context 'when user is not logged in' do
    it 'has _welcome partial' do
      render
      expect(rendered).to include t('welcome_pages.welcome.title')
      expect(rendered).to include t('welcome_pages.welcome.subtitle')
      expect(rendered).to have_link t('welcome_pages.welcome.sign_up_link'), href: new_user_registration_path
    end
  end

  context 'when user is logged in' do
    let(:user) { create(:user) }

    before do
      sign_in user
      render
    end

    after do
      sign_out user
    end

    it 'has not a Sign Up link for user' do
      expect(rendered).not_to have_link t('welcome_pages.welcome.sign_up_link'), href: new_user_registration_path
    end
  end
end
