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
      expect(page).to have_content('Latitude is invalid')
      expect(page).to have_content('Longitude is invalid')
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
      expect(page).to have_content('Latitude is invalid')
      expect(page).to have_content('Longitude is invalid')
    end
  end

  context 'when showing a location' do
    it 'lists collection of locations' do
      expect(page).to have_content('Listing Locations')
    end

    it 'shows a single location' do
      visit location_path(location)
      expect(page).to have_content(location.name)
      expect(page).to have_content(location.address)
      expect(page).to have_content(location.latitude)
      expect(page).to have_content(location.longitude)
    end
  end
end
