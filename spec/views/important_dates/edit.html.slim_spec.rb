# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'important_dates/edit', type: :view do
  before do
    @important_date = assign(:important_date, ImportantDate.create!(
      event: 'MyText',
      description: 'MyString'
    ))
  end

  it 'renders the edit important_date form' do
    render
    assert_select 'form[action=?][method=?]', important_date_path(@important_date), 'post' do

      assert_select 'textarea[name=?]', 'important_date[event]'

      assert_select 'input[name=?]', 'important_date[description]'
    end
  end
end
