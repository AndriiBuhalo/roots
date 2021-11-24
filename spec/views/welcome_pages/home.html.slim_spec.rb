# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/home.html.slim', type: :view do
  include Devise::Test::ControllerHelpers

  context 'user is not logged in' do
    it 'has _home partial' do
      render
      expect(rendered).to include t('welcome_pages.home.title')
      expect(rendered).to include t('welcome_pages.home.subtitle')
      expect(rendered).to have_link t('welcome_pages.home.sign_up_link'), href: new_user_registration_path
    end
  end

  context 'user is logged in' do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
      render
    end

    after do
      sign_out user
    end

    it 'has not a Sign Up link for user' do
      expect(rendered).not_to have_link t('welcome_pages.home.sign_up_link'), href: new_user_registration_path
    end
  end
end
