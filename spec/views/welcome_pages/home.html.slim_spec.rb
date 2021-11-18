# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/home.html.slim', type: :view do
  include Devise::Test::ControllerHelpers
  describe 'home page' do
    before do
      render template: 'welcome_pages/home', layout: 'layouts/public'
    end

    it 'has header menu for public' do
      expect(rendered).to have_title t('layouts.page_title')
      expect(rendered).to have_link t('layouts.header.sign_up'), href: new_user_registration_path
      expect(rendered).to have_link t('layouts.header.log_in'), href: new_user_session_path
    end

    it 'has _home partial' do
      expect(rendered).to include t('welcome_pages.home.title')
      expect(rendered).to include t('welcome_pages.home.subtitle')
    end

    it 'has footer navbar' do
      expect(rendered).to include t('layouts.footer.string')
      expect(rendered).to have_link t('layouts.footer.about'), href: welcome_pages_about_path
      expect(rendered).to have_link t('layouts.footer.contacts'), href: welcome_pages_contacts_path
    end
  end
end
