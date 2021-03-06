# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ImportantDates', type: :feature do
  let(:user) { create(:user) }
  let(:important_date) { create(:important_date, created_by: user) }

  before(:each) do
    sign_in(user)
  end

  context 'when creating an Important date' do
    it 'creates' do
      visit important_dates_path(important_date)
      click_link 'New Important date'
      fill_in 'Event name', with: 'Test Event'
      fill_in 'Event date', with: '12/8/2000'
      fill_in 'Description', with: 'Test Description'
      click_button 'Submit'
      expect(page).to have_content('Important date was successfully created')
    end

    it 'does not create' do
      visit important_dates_path(important_date)
      click_link 'New Important date'
      fill_in 'Event name', with: 'Test Event'
      fill_in 'Event date', with: '12/8/2000'
      fill_in 'Description', with: ''
      click_button 'Submit'
      expect(page).to have_content("Description can't be blank and Description is too short (minimum is 3 characters)")
    end
  end

  context 'when updating an Important date' do
    it 'updates' do
      visit edit_important_date_path(important_date)
      fill_in 'Event name', with: 'Test Event'
      fill_in 'Event date', with: '12/8/2000'
      fill_in 'Description', with: 'Test Description'
      click_button 'Submit'
      expect(page).to have_content('Important date was successfully updated')
    end

    it 'does not update' do
      visit edit_important_date_path(important_date)
      fill_in 'Event name', with: 'Test Event'
      fill_in 'Event date', with: '12/8/2000'
      fill_in 'Description', with: ''
      click_button 'Submit'
      expect(page).to have_content("Description can't be blank and Description is too short (minimum is 3 characters)")
    end
  end

  context 'when an Important date is shown' do
    it 'List and Show Date' do
      visit important_dates_path(important_date)
      expect(page).to have_content('Listing important dates')
      expect(page).to have_link('Show')
      click_link 'Show'
      expect(page).to have_link('Back')
    end
  end
end
