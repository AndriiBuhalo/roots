# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  it 'User sign up' do
    visit('welcome_pages/home')
    click_link 'Sign up'
    expect(page).to have_current_path(new_user_registration_path, ignore_query: true)
    fill_in 'Email', with: 'tester@example.tld'
    fill_in 'Password', with: 'test-password'
    fill_in 'Password confirmation', with: 'test-password'
    click_button 'Sign up'
    expect(page).to have_current_path '/'
    expect(page).to have_content('tester@example.tld')
  end

  it 'User sign in and log out' do
    create(:user, email: 'someone@example.tld', password: 'somepassword')
    visit('welcome_pages/home')
    click_link 'Log In'
    expect(page).to have_current_path(new_user_session_path, ignore_query: true)

    fill_in 'Email', with: 'someone@example.tld'
    fill_in 'Password', with: 'somepassword'
    click_button 'Log in'

    expect(page).to have_current_path '/'
    expect(page).to have_content('someone@example.tld')
    expect(page).to have_link('Log Out')

    click_on 'Log Out'
    expect(page).to have_current_path '/'
    expect(page).to have_link('Sign Up')
  end

  context 'when password is not confirmed' do
    before do
      visit new_user_registration_path
    end

    it 'incorrect password confirmation' do
      fill_in 'Email', with: 'tester@example.tld'
      fill_in 'Password', with: 'test-password'
      fill_in 'Password confirmation', with: 'not-test-password'
      click_button 'Sign up'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
