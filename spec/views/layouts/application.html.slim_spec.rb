# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/application.html.slim', type: :view do
  include Devise::Test::ControllerHelpers

  before do
    render
  end

  context 'when user is not logged in' do
    it 'has header menu for application' do
      expect(rendered).to have_title t('global.page_title')
      expect(rendered).to have_link t('global.header.sign_up'), href: new_user_registration_path
      expect(rendered).to have_link t('global.header.log_in'), href: new_user_session_path
    end
  end

  context 'when user is logged in' do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
      render
    end

    after do
      sign_out user
    end

    it 'has header menu for user' do
      expect(rendered).to have_title t('global.page_title')
      expect(rendered).to have_link t('global.header.posts'), href: posts_path
      expect(rendered).to have_link t('global.header.albums')
      expect(rendered).to have_link t('global.header.person')
      expect(rendered).to have_css('.gravatar')
    end
  end

  it 'has footer navbar' do
    expect(rendered).to include t('global.footer.string')
    expect(rendered).to have_link t('global.footer.about'), href: welcome_pages_about_path
    expect(rendered).to have_link t('global.footer.contacts'), href: welcome_pages_contacts_path
    expect(rendered).to have_link t('global.footer.softserve'), href: 'https://www.softserveinc.com/uk-ua'
  end
end
