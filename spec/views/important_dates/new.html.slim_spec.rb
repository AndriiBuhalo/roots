# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'important_dates/new', type: :view do
  let(:valid_important_date) { build(:important_date) }

  before do
    assign(:important_date, valid_important_date)
  end

  it 'renders new important date form' do
    render
    expect(rendered).to include t('important_dates.new.title')
    expect(rendered).to render_template(partial: 'important_dates/_form')
    expect(rendered).to have_link t('important_dates.new.back'), href: important_dates_path
  end
end
