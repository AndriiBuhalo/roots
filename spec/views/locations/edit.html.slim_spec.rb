# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'locations/edit', type: :view do
  let(:user) { create(:user) }
  let(:location) { create(:location, created_by: user) }

  before(:each) do
    assign(:location, location)
  end

  it 'renders the edit location form' do
    render
    expect(rendered).to have_text t('locations.edit.title')
    expect(rendered).to render_template(partial: 'locations/_form')
    expect(rendered).to have_link t('locations.edit.show'), href: location_path(location)
    expect(rendered).to have_link t('locations.edit.back'), href: locations_path
  end
end
