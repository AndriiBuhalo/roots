# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/contacts.html.slim', type: :view do
  include Devise::Test::ControllerHelpers

  describe 'contacts page for public' do
    it 'has header menu for public' do
      render template: 'welcome_pages/contacts', layout: 'layouts/public'
      expect(rendered).to have_title t('layouts.page_title')
      expect(rendered).to have_link t('layouts.header.sign_up'), href: new_user_registration_path
      expect(rendered).to have_link t('layouts.header.log_in'), href: new_user_session_path
    end
  end

  describe 'contacts page for user' do
    it 'has header menu for user' do
      user = FactoryBot.create(:user)
      sign_in user
      render template: 'welcome_pages/contacts', layout: 'layouts/application'
      expect(rendered).to have_title t('layouts.page_title')
      expect(rendered).to have_link t('layouts.header.posts'), href: posts_path
      expect(rendered).to have_link t('layouts.header.albums')
      expect(rendered).to have_css('img.gravatar')
      sign_out user
    end
  end

  describe 'contacts page and footer' do
    before do
      render template: 'welcome_pages/contacts', layout: 'layouts/public'
    end

    it 'has _contacts partial' do
      expect(rendered).to include t('welcome_pages.contacts.title')
      expect(rendered).to include t('welcome_pages.contacts.subtitle')
      expect(rendered).to have_link t('welcome_pages.contacts.nikolay'), href: 'https://github.com/Nikolay010'
      expect(rendered).to have_link t('welcome_pages.contacts.ostap'), href: 'https://github.com/semenchukostap'
      expect(rendered).to have_link t('welcome_pages.contacts.valentyn'), href: 'https://github.com/N1KeLoS'
      expect(rendered).to have_link t('welcome_pages.contacts.max'), href: 'https://github.com/Stankovskij'
      expect(rendered).to have_link t('welcome_pages.contacts.svitlana'), href: 'https://github.com/SvitDZHUS'
      expect(rendered).to have_link t('welcome_pages.contacts.andrii'), href: 'https://github.com/AndriiBuhalo'
    end

    it 'has footer navbar' do
      expect(rendered).to include t('layouts.footer.string')
      expect(rendered).to have_link t('layouts.footer.about'), href: welcome_pages_about_path
      expect(rendered).to have_link t('layouts.footer.contacts'), href: welcome_pages_contacts_path
      expect(rendered).to have_link t('layouts.footer.softserve'), href: 'https://www.softserveinc.com/uk-ua'
    end
  end
end
