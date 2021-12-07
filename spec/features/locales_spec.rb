# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before do
    visit('welcome_pages/welcome')
  end

  it 'switches the locale for public' do
    expect(I18n.locale).to eq :en
    click_link I18n.t('global.header.uk_switch')
    expect(I18n.locale).to eq :uk
    expect(page).to have_content(I18n.t('global.translate'))
    visit('about')
    expect(I18n.locale).to eq :uk
    visit('contacts')
    expect(I18n.locale).to eq :uk
  end

  it 'switches the locale for user' do
    expect(I18n.locale).to eq :en
    click_link I18n.t('global.header.sign_up')
    fill_in 'Email', with: 'tester@example.tld'
    fill_in 'Password', with: 'test-password'
    fill_in 'Password confirmation', with: 'test-password'
    click_button I18n.t('devise.registrations.new.title')
    expect(I18n.locale).to eq :en
    click_link I18n.t('global.header.uk_switch')
    expect(I18n.locale).to eq :uk
    expect(page).to have_content(I18n.t('global.translate'))
    click_on I18n.t('global.header.log_out')
    expect(I18n.locale).to eq :uk
  end
end
