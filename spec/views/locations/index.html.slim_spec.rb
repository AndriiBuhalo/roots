# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'locations/index', type: :view do
  let(:user) { create(:user) }
  let(:location) { create(:location, created_by: user) }

  before(:each) do
    assign(:locations, [location])
  end

  it 'renders a list of locations' do
    allow(view).to receive_messages(will_paginate: nil)
    render
    expect(rendered).to include t('locations.index.main_title')
    expect(rendered).to include t('locations.index.name')
    expect(rendered).to include t('locations.index.address')
    expect(rendered).to include t('locations.index.latitude')
    expect(rendered).to include t('locations.index.longitude')
    expect(rendered).to include location.name
    expect(rendered).to include location.address
    expect(rendered).to include location.latitude.to_s
    expect(rendered).to include location.longitude.to_s
    expect(rendered).to have_link t('locations.index.show'), href: location_path(location)
    expect(rendered).to have_link t('locations.index.edit'), href: edit_location_path(location)
    expect(rendered).to have_link t('locations.index.destroy'), href: location_path(location)
    expect(rendered).to have_link t('locations.index.new_location'), href: new_location_path
  end
end
