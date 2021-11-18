require 'rails_helper'

RSpec.describe 'welcome_pages/contacts.html.slim', type: :view do
  include Devise::Test::ControllerHelpers

	before(:each) do
	  render template: 'welcome_pages/contacts', layout: 'layouts/application'
  end

  it 'has header menu for public' do
	  expect(rendered).to have_title t('global.page_title')
    expect(rendered).to have_link t('global.header.home'), href: welcome_pages_home_path
    expect(rendered).to have_link t('global.header.sign_up'), href: new_user_registration_path
    expect(rendered).to have_link t('global.header.log_in'), href: new_user_session_path
	end

	it 'has _contacts partial' do
    expect(rendered).to include t('welcome_pages.contacts.title')
    expect(rendered).to include t('welcome_pages.contacts.subtitle')
  end

  it 'has footer navbar' do
    expect(rendered).to include t('global.footer.string')
    expect(rendered).to have_link t('global.footer.about'), href: welcome_pages_about_path
    expect(rendered).to have_link t('global.footer.contacts'), href: welcome_pages_contacts_path
  end

end