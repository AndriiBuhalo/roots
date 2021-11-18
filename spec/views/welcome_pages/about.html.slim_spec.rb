# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/about.html.slim', type: :view do
  include Devise::Test::ControllerHelpers
  describe 'about page' do
    before do
      render template: 'welcome_pages/about', layout: 'layouts/public'
    end

    it 'has header menu for public' do
      expect(rendered).to have_title t('layouts.page_title')
      expect(rendered).to have_link t('layouts.header.sign_up'), href: new_user_registration_path
      expect(rendered).to have_link t('layouts.header.log_in'), href: new_user_session_path
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
    end
  end
end
