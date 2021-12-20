# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'locations/show', type: :view do
  let(:user) { create(:user) }
  let(:location) { create(:location, created_by: user) }

  before(:each) do
    assign(:location, location)
  end

  it 'renders show form' do
    render
    expect(rendered).to include t('locations.show.name')
    expect(rendered).to include location.name
    expect(rendered).to include t('locations.show.address')
    expect(rendered).to include location.address
    expect(rendered).to include t('locations.show.latitude')
    expect(rendered).to include location.latitude.to_s
    expect(rendered).to include t('locations.show.longitude')
    expect(rendered).to include location.longitude.to_s
    expect(rendered).to have_link t('locations.show.edit'), href: edit_location_path(location)
    expect(rendered).to have_link t('locations.show.back'), href: locations_path
  end
end
