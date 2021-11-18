# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/contacts.html.slim', type: :view do
  include Devise::Test::ControllerHelpers
  describe 'contacts page' do
    before do
      render template: 'welcome_pages/contacts', layout: 'layouts/public'
    end

    it 'has header menu for public' do
      expect(rendered).to have_title t('layouts.page_title')
      expect(rendered).to have_link t('layouts.header.sign_up'), href: new_user_registration_path
      expect(rendered).to have_link t('layouts.header.log_in'), href: new_user_session_path
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
    end
  end
end
