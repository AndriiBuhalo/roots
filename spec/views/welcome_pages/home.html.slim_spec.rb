# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/home.html.slim', type: :view do
  include Devise::Test::ControllerHelpers
  it 'has _home partial' do
    render
    expect(rendered).to include t('welcome_pages.home.title')
    expect(rendered).to include t('welcome_pages.home.subtitle')
    expect(rendered).to have_link t('welcome_pages.home.sign_up_link'), href: new_user_registration_path
  end

  it 'has not a Sign Up link for user' do
    user = FactoryBot.create(:user)
    sign_in user
    render
    expect(rendered).not_to have_link t('welcome_pages.home.sign_up_link'), href: new_user_registration_path
    sign_out user
  end
end
