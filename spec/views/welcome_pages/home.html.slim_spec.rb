# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/home.html.slim', type: :view do
  include Devise::Test::ControllerHelpers

  describe 'home page for public' do
    it 'has header menu for public' do
      render template: 'welcome_pages/home', layout: 'layouts/public'
      expect(rendered).to have_title t('global.page_title')
      expect(rendered).to have_link t('global.header.sign_up'), href: new_user_registration_path
      expect(rendered).to have_link t('global.header.log_in'), href: new_user_session_path
    end
  end

  describe 'home page for user' do
    it 'has header menu for user' do
      user = FactoryBot.create(:user)
      sign_in user
      render template: 'welcome_pages/home', layout: 'layouts/application'
      expect(rendered).to have_title t('global.page_title')
      expect(rendered).to have_link t('global.header.posts'), href: posts_path
      expect(rendered).to have_link t('global.header.albums')
      expect(rendered).to have_css('img.gravatar')
      sign_out user
    end
  end

  describe 'home page and footer' do
    before do
      render template: 'welcome_pages/home', layout: 'layouts/public'
    end

    it 'has _home partial' do
      expect(rendered).to include t('welcome_pages.home.title')
      expect(rendered).to include t('welcome_pages.home.subtitle')
    end

    it 'has footer navbar' do
      expect(rendered).to include t('global.footer.string')
      expect(rendered).to have_link t('global.footer.about'), href: welcome_pages_about_path
      expect(rendered).to have_link t('global.footer.contacts'), href: welcome_pages_contacts_path
      expect(rendered).to have_link t('global.footer.softserve'), href: 'https://www.softserveinc.com/uk-ua'
    end
  end
end
