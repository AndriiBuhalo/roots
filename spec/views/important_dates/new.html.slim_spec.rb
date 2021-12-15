# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'important_dates/new', type: :view do
  let(:user) { create(:user) }
  let(:important_date) { create(:important_date, created_by: user) }

  before(:each) do
    assign(:important_date, important_date)
  end

  it 'renders new important date form' do
    render
    expect(rendered).to include t('important_dates.new.title')
    expect(rendered).to render_template(partial: 'important_dates/_form')
    expect(rendered).to have_link t('important_dates.new.back'), href: important_dates_path
  end
end
