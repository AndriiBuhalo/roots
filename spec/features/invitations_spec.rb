# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Invitations', type: :feature do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
    visit invitations_path
    click_link 'Invite new User!'
  end

  context 'when all data is valid' do
    it 'sends an invitation and shows a flash message' do
      fill_in 'Email', with: 'svittester@example.tld'
      click_button 'Send an invitation'
      expect(page).to have_content 'An invitation email has been sent to svittester@example.tld.'
    end

    it 'allows to accept an invitation' do
      fill_in 'Email', with: 'svittester@example.tld'
      click_button 'Send an invitation'
      click_link 'Log Out'
      open_email 'svittester@example.tld'
      visit_in_email 'Accept invitation'
      fill_in 'Password', with: 'testpassword'
      fill_in 'Password confirmation', with: 'testpassword'
      click_button 'Sign up'
      expect(page).to have_content 'Your password was set successfully. You are now signed in.'
    end
  end

  context 'when some data is not valid' do
    it 'does not sends an invitation and shows an error message' do
      fill_in 'Email', with: 'svittester'
      click_button 'Send an invitation'
      expect(page).to have_content 'Email is invalid'
    end

    it 'allows to accept an invitation' do
      fill_in 'Email', with: 'svittester@example.tld'
      click_button 'Send an invitation'
      click_link 'Log Out'
      open_email 'svittester@example.tld'
      visit_in_email 'Accept invitation'
      fill_in 'Password', with: 'pa'
      fill_in 'Password confirmation', with: 'testpassword'
      click_button 'Sign up'
      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
      expect(page).to have_content 'Password confirmation doesn\'t match Password'
    end
  end
end
