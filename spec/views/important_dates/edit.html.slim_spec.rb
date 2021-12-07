# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'important_dates/edit', type: :view do
  let(:user) { create(:user) }
  let(:important_date) { create(:important_date, created_by: user) }

  before do
    assign(:important_date, important_date)
  end

  it 'renders the edit important_date form' do
    render
    expect(rendered).to include t('important_dates.edit.title')
    expect(rendered).to render_template(partial: 'important_dates/_form')
    expect(rendered).to have_link t('important_dates.edit.show'), href: important_date_path(important_date)
    expect(rendered).to have_link t('important_dates.edit.back'), href: important_dates_path
  end
end
