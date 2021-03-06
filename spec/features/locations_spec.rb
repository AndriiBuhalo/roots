# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Locations', type: :feature do
  let(:user) { create(:user) }
  let(:location) { create(:location, created_by: user) }

  before(:each) do
    sign_in(user)
    visit locations_path
  end

  context 'when creating a location' do
    it 'creates a location with valid params' do
      click_link 'New Location'
      fill_in 'Name', with: 'Big Ben'
      fill_in 'Address', with: 'London SW1A 0AA, United Kingdom'
      fill_in 'Latitude', with: '51.510357'
      fill_in 'Longitude', with: '-0.116773'
      click_button 'Submit'
      expect(page).to have_content('Location was successfully created')
    end

    it 'does not create a location with invalid params' do
      click_link 'New Location'
      fill_in 'Name', with: 'Bi'
      fill_in 'Address', with: ''
      fill_in 'Latitude', with: '91.510357'
      fill_in 'Longitude', with: '-190.116773'
      click_button 'Submit'
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
      expect(page).to have_content("Address can't be blank and Address is too short (minimum is 5 characters)")
      expect(page).to have_content('Latitude must be less than or equal to 90')
      expect(page).to have_content('Longitude must be greater than or equal to -180')
    end
  end

  context 'when updating a location' do
    it 'updates a location with valid params' do
      visit edit_location_path(location)
      fill_in 'Name', with: 'Big Ben'
      fill_in 'Address', with: 'London SW1A 0AA, United Kingdom'
      fill_in 'Latitude', with: '51.510357'
      fill_in 'Longitude', with: '-0.116773'
      click_button 'Submit'
      expect(page).to have_content('Location was successfully updated')
    end

    it 'does not update a location with invalid params' do
      visit edit_location_path(location)
      fill_in 'Name', with: 'Bi'
      fill_in 'Address', with: ''
      fill_in 'Latitude', with: '91.510357'
      fill_in 'Longitude', with: '-190.116773'
      click_button 'Submit'
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
      expect(page).to have_content("Address can't be blank and Address is too short (minimum is 5 characters)")
      expect(page).to have_content('Latitude must be less than or equal to 90')
      expect(page).to have_content('Longitude must be greater than or equal to -180')
    end
  end
end
