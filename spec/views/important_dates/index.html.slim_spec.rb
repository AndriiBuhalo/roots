# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'important_dates/index', type: :view do
  let(:user) { create(:user) }
  let(:important_date) { create(:important_date, created_by: user) }

  before do
    assign(:important_dates, [important_date])
  end

  it 'renders a list of important_dates' do
    render
    expect(rendered).to include t('important_dates.index.main_title')
    expect(rendered).to include t('important_dates.index.event_name')
    expect(rendered).to include t('important_dates.index.event_date')
    expect(rendered).to include t('important_dates.index.description')
    expect(rendered).to include important_date.event_name
    expect(rendered).to include important_date.event_date.to_s
    expect(rendered).to include important_date.description
    expect(rendered).to have_link t('important_dates.index.show'), href: important_date_path(important_date)
    expect(rendered).to have_link t('important_dates.index.edit'), href: edit_important_date_path(important_date)
    expect(rendered).to have_link t('important_dates.index.destroy'), href: important_date_path(important_date)
    expect(rendered).to have_link t('important_dates.index.new_important_date'), href: new_important_date_path
  end
end
