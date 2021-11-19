# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/about.html.slim', type: :view do
  include Devise::Test::ControllerHelpers
  describe 'about page for public' do
    it 'has header menu for public' do
      render template: 'welcome_pages/about', layout: 'layouts/public'
      expect(rendered).to have_title t('layouts.page_title')
      expect(rendered).to have_link t('layouts.header.sign_up'), href: new_user_registration_path
      expect(rendered).to have_link t('layouts.header.log_in'), href: new_user_session_path
    end
  end

  describe 'about page for user' do
    it 'has header menu for user' do
      user = FactoryBot.create(:user)
      sign_in user
      render template: 'welcome_pages/about', layout: 'layouts/application'
      expect(rendered).to have_title t('layouts.page_title')
      expect(rendered).to have_link t('layouts.header.posts'), href: posts_path
      expect(rendered).to have_link t('layouts.header.albums')
      expect(rendered).to have_css('img.gravatar')
      sign_out user
    end
  end

  describe 'about page and footer' do
    before do
      render template: 'welcome_pages/about', layout: 'layouts/public'
    end

    it 'has _about partial' do
      expect(rendered).to include t('welcome_pages.about.title')
      expect(rendered).to include t('welcome_pages.about.subtitle')
      expect(rendered).to have_css('.card', count: 3)
      expect(rendered).to include t('welcome_pages.about.family_tree_title')
      expect(rendered).to include t('welcome_pages.about.family_tree_paragraph')
      expect(rendered).to include t('welcome_pages.about.personal_posts_title')
      expect(rendered).to include t('welcome_pages.about.personal_posts_paragraph')
      expect(rendered).to include t('welcome_pages.about.photo_albums_title')
      expect(rendered).to include t('welcome_pages.about.photo_albums_paragraph')
    end

    it 'has footer navbar' do
      expect(rendered).to include t('layouts.footer.string')
      expect(rendered).to have_link t('layouts.footer.about'), href: welcome_pages_about_path
      expect(rendered).to have_link t('layouts.footer.contacts'), href: welcome_pages_contacts_path
      expect(rendered).to have_link t('layouts.footer.softserve'), href: 'https://www.softserveinc.com/uk-ua'
    end
  end
end
