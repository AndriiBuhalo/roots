# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'important_dates/new', type: :view do
  before do
    assign(:important_date, ImportantDate.new(
      event: 'MyText',
      description: 'MyString'
    ))
  end

  it 'renders new important_date form' do
    render
    assert_select 'form[action=?][method=?]', important_dates_path, 'post' do
      assert_select 'textarea[name=?]', 'important_date[event]'
      assert_select 'input[name=?]', 'important_date[description]'
    end
  end
end
