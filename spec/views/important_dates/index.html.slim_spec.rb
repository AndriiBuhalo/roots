require 'rails_helper'

RSpec.describe "important_dates/index", type: :view do
  before(:each) do
    assign(:important_dates, [
      ImportantDate.create!(
        event: "MyText",
        description: "Description"
      ),
      ImportantDate.create!(
        event: "MyText",
        description: "Description"
      )
    ])
  end

  it "renders a list of important_dates" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
