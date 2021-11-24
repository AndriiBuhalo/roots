# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/contacts.html.slim', type: :view do
  it 'has _contacts partial' do
    render
    expect(rendered).to include t('welcome_pages.contacts.title')
    expect(rendered).to include t('welcome_pages.contacts.subtitle')
    expect(rendered).to have_link t('welcome_pages.contacts.nikolay'), href: 'https://github.com/Nikolay010'
    expect(rendered).to have_link t('welcome_pages.contacts.ostap'), href: 'https://github.com/semenchukostap'
    expect(rendered).to have_link t('welcome_pages.contacts.valentyn'), href: 'https://github.com/N1KeLoS'
    expect(rendered).to have_link t('welcome_pages.contacts.max'), href: 'https://github.com/Stankovskij'
    expect(rendered).to have_link t('welcome_pages.contacts.svitlana'), href: 'https://github.com/SvitDZHUS'
    expect(rendered).to have_link t('welcome_pages.contacts.andrii'), href: 'https://github.com/AndriiBuhalo'
  end
end
