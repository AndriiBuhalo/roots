# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'important_dates/show', type: :view do
  let(:user) { create(:user) }
  let(:important_date) { create(:important_date, created_by: user) }

  before do
    assign(:important_date, important_date)
  end

  it 'renders show form' do
    render
    expect(rendered).to include t('important_dates.show.event')
    expect(rendered).to include important_date.event
    expect(rendered).to include t('important_dates.show.event_date')
    #expect(rendered).to include important_date.event_date
    expect(rendered).to include t('important_dates.show.description')
    expect(rendered).to include important_date.description
    expect(rendered).to have_link t('important_dates.show.edit'), href: edit_important_date_path(important_date)
    expect(rendered).to have_link t('important_dates.show.back'), href: important_dates_path
  end
end
