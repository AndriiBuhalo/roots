# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'locations/new', type: :view do
  let(:user) { create(:user) }
  let(:location) { create(:location, created_by: user) }

  before(:each) do
    assign(:location, location)
  end

  it 'renders new location form' do
    render
    expect(rendered).to have_text t('locations.new.title')
    expect(rendered).to render_template(partial: 'locations/_form')
    expect(rendered).to have_link t('locations.new.back'), href: locations_path
  end
end
